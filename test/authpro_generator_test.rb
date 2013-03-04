require 'test_helper'
require 'rails'

class AuthproGeneratorTest < Rails::Generators::TestCase
  tests AuthproGenerator
  destination File.expand_path("../tmp/dummy", File.dirname(__FILE__))
  setup :prepare_destination

  test "Assert all files are properly created" do
    run_generator
    FileUtils.cp_r "dummy", "../tmp"
    assert_file "config/initializers/devise.rb"
    assert_file "config/locales/devise.en.yml"
  end

end