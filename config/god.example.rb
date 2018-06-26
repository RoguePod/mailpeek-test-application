# frozen_string_literal: true

rails_env  = 'development'
rails_root = '/path/to/rails/root'

queues = {
  default: 1,
  mailers: 1
}

queues.each do |queue, workers|
  God.watch do |w|
    w.dir      = rails_root
    w.name     = "sidekiq-#{rails_env}-#{queue}"
    w.group    = 'sidekiq'
    w.log      = "#{rails_root}/log/god-#{queue}.log"
    w.interval = 30.seconds
    w.env      = { 'RAILS_ENV' => rails_env }
    w.start    = "sidekiq -e #{rails_env} -q #{queue} -c #{workers}"
    w.stop     = "sidekiqctl stop #{w.pid_file}"

    # restart if memory gets too high
    w.transition(:up, :restart) do |on|
      # on.condition(:memory_usage) do |c|
      #   c.above = 1.gigabytes
      #   c.times = 2
      # end

      # on.condition(:restart_file_touched) do |c|
      #   c.interval      = 5.seconds
      #   c.restart_file  = '/tmp/restart_god.txt'
      # end
    end

    # determine the state on startup
    w.transition(:init, true => :up, false => :start) do |on|
      on.condition(:process_running) do |c|
        c.running = true
      end
    end

    # determine when process has finished starting
    w.transition(%i[start restart], :up) do |on|
      on.condition(:process_running) do |c|
        c.running = true
        c.interval = 5.seconds
      end

      # failsafe
      on.condition(:tries) do |c|
        c.times = 5
        c.transition = :start
        c.interval = 5.seconds
      end
    end

    # start if process is not running
    w.transition(:up, :start) do |on|
      on.condition(:process_running) do |c|
        c.running = false
      end
    end
  end
end
