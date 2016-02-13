# Public: Controller for static pages
class StaticController < ApplicationController
  def index
    n = rand(5) + 1

    @data = {
      subject: Faker::Lorem.sentence,
      to: Faker::Internet.email,
      from: Faker::Internet.email,
      body: Faker::Lorem.paragraphs(n).join("\r\n\r\n")
    }
  end

  def robots
    robots = File.read(Rails.root + "config/robots/robots.#{Rails.env}.txt")
    render text: robots, layout: false, content_type: 'text/plain'
  end
end
