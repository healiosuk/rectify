guard(:rspec, cmd: "bin/rspec") do
  require "guard/rspec/dsl"

  dsl = Guard::RSpec::Dsl.new(self)

  # RSpec files
  rspec = dsl.rspec
  spec_dir = rspec.spec_dir
  watch(rspec.spec_helper) { spec_dir }
  watch(rspec.spec_support) { spec_dir }
  watch(rspec.spec_files)

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  fixtures = [
    { dir: "commands", spec: "command" },
    { dir: "controllers", spec: "controller_helpers" },
    { dir: "forms", spec: "form" },
    { dir: "presenters", spec: "presenter" },
    { dir: "queries", spec: "query" }
  ]

  fixtures.each do |dir:, spec:|
    watch(%r{^spec/fixtures/#{dir}/.+\.rb$}) { rspec.spec.call("lib/rectify/#{spec}") }
  end
end

guard(:rubocop, all_on_start: false) do
  watch("Gemfile")
  watch("Guardfile")
  watch("Rakefile")
  watch("config.ru")
  watch(/.+\.rake$/)
  watch(/.+\.rb$/)
  watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
end
