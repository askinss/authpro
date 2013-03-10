# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

FileUtils.cp_r __dir__ + "/dummy", __dir__ + "/rails"
require File.expand_path("../rails/dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require "rails/generators/test_case"
require "capybara/rails"
require "database_cleaner"
require "timecop"
require "generators/authpro/authpro_generator"

Rails.backtrace_cleaner.remove_silencers!

DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  self.use_transactional_fixtures = false

  teardown do
    DatabaseCleaner.clean
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

