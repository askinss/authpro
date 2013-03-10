require 'test_helper'

class AuthproIntegrationTest < ActionDispatch::IntegrationTest
  
  setup do
    # We should really run the generator here
    ActiveRecord::Migration.verbose = false
    ActiveRecord::Migrator.migrate("#{Rails.root}/db/migrate")
    Dummy::Application.reload_routes!
    @user = User.create!(email: "master@example.com", password: "sekret123", password_confirmation: "sekret123")
  end

  test "Visit home" do
    visit "/"
    assert page.body.include? "Home"
  end

  test "signup" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "user@example.com"
    pass = "sekret123"
    fill_in "user_password", with: pass
    fill_in "user_password_confirmation", with: pass
    click_button "Create User"
    assert page.body.include? "Signed up!"    
  end

  test "signup failing" do
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: "user@example.com"
    fill_in "user_password", with: "sekret123"
    fill_in "user_password_confirmation", with: "another password"
    click_button 'Create User'
    assert page.body.include? "Form is invalid"
  end

  test "login" do
    visit "/"
    click_link "Log in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "sekret123"
    click_button "Log in"
    assert page.body.include?("Logged in!")
  end

  test "login failing" do
    visit "/"
    click_link "Log in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "wrong_password!"
    click_button "Log in"
    assert page.body.include?("Invalid email or password")
  end

  test "logout" do
    skip
  end

  test "Reset password" do
    skip
  end

  test "Reset password failing" do
    skip
  end

end