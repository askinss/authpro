require 'test_helper'

class AuthproIntegrationTest < ActionDispatch::IntegrationTest
  
  setup do
    # We should really run the generator here
    ActiveRecord::Migration.verbose = false
    ActiveRecord::Migrator.migrate("#{Rails.root}/db/migrate")
    Dummy::Application.reload_routes! 
  end

  test "Visit home" do
    visit "/"
    assert page.body.include? "Home"
  end

  test "successful signup" do
    visit "/"
    click_link "Sign up"
    
  end

end