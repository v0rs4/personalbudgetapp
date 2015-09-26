ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start 'rails'

require_relative '../config/environment'

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
    mocks.verify_doubled_constant_names = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.full_backtrace = true
    config.default_formatter = 'doc'
  end

  config.profile_examples = 5

  config.order = :random

  Kernel.srand config.seed

  config.warnings = false

  config.use_transactional_fixtures = false

  config.around(:each) { |xmpl| DatabaseCleaner.cleaning { xmpl.run } }

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.around(:each) { |xmpl| DatabaseCleaner.cleaning { xmpl.run } }
  config.infer_spec_type_from_file_location!
end
