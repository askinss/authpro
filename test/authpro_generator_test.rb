require 'test_helper'
require 'rails'

class AuthproGeneratorTest < Rails::Generators::TestCase
  tests AuthproGenerator
  destination __dir__ + "/rails/dummy"
  #setup :prepare_destination
  #teardown :cleanup_destination_root
  
  test "Assert all files are properly created" do 
    run_generator
    assert_file "app/models/user.rb"
  end
end