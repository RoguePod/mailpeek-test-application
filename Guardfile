guard :rubocop, all_on_start: true, cli: ['-R'] do
  watch(%r{.+\.rb$})
  watch(%r{.+\.rake$})
  watch(%r{.+\.jbuilder$})
  watch(%r{Rakefile$})
  watch(%r{Gemfile$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end
