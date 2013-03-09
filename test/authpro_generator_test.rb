require 'test_helper'
require 'rails'

class AuthproGeneratorTest < Rails::Generators::TestCase
  tests AuthproGenerator
  destination File.expand_path("rails/dummy", File.dirname(__FILE__))
  #setup :prepare_destination

  test "Assert all files are properly created" do
    run_generator
    assert_file "config/initializers/devise.rb"
    assert_file "config/locales/devise.en.yml"
  end
end