unless ENV["DISABLE_COVERAGE"]
  require "simplecov"
  SimpleCov.start do
    enable_coverage :branch
    add_filter "spec"
  end
end

require File.expand_path("../lib/rectify", __dir__)
require File.expand_path("../lib/rectify/rspec", __dir__)

require "rspec/collection_matchers"
require "action_controller"

Dir["spec/support/**/*.rb"].each  { |f| require File.expand_path(f) }
Dir["spec/fixtures/**/*.rb"].each { |f| require File.expand_path(f) }

system("rake db:migrate")

db_config = YAML.safe_load(File.open("spec/config/database.yml"))
ActiveRecord::Base.establish_connection(db_config)

RSpec.configure do |config|
  config.include Rectify::RSpec::Helpers

  config.expect_with(:rspec) do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with(:rspec) do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!

  config.backtrace_exclusion_patterns << /gems/
  config.default_formatter = config.files_to_run.one? ? "doc" : "Fuubar"
  config.example_status_persistence_file_path = "spec/examples.txt"
  config.filter_run_when_matching :focus
  config.order = :random

  config.around do |test|
    ActiveRecord::Base.transaction do
      test.run
      raise ActiveRecord::Rollback
    end
  end

  Kernel.srand config.seed
end

Rectify::RSpec::DatabaseReporter.enable
