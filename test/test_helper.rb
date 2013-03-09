# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

FileUtils.cp_r __dir__ + "/dummy", __dir__ + "/rails"
require File.expand_path("../rails/dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

require "rails/generators/test_case"
require "generators/authpro/authpro_generator"