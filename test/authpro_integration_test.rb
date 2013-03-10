require "test_helper"
require "uri"

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
    visit "/login"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "sekret123"
    click_button "Log in"
    click_link "Log out"
    assert page.body.include?("Logged out!")
  end

  test "Reset password" do
    visit "/login"
    click_link "Forgot your password?"
    fill_in "Email", with: @user.email
    click_button "Reset password"
    assert page.body.include?("Email sent with password reset instructions.")
    
    # The e-mail part
    mail = ActionMailer::Base.deliveries.last
    assert "from@example.com" == mail["from"].to_s
    assert @user.email == mail["to"].to_s
    assert "Password Reset" == mail["subject"].to_s
    body = mail.body.to_s
    url = URI.extract(body).first
    
    visit url
    fill_in "user_password", with: "new_password!"
    fill_in "user_password_confirmation", with: "new_password!"
    click_button "Update password"
    assert page.body.include?("Password has been reset.")   
  end

  test "Reset password failing because email does not exist" do
    visit "/login"
    click_link "Forgot your password?"
    fill_in "Email", with: "nosense@example.com"
    click_button "Reset password"
    assert page.body.include?("We could not find anyone with that email address.")
  end

  test "Reset password failing because we enter a new invalid password" do
    visit "/login"
    click_link "Forgot your password?"
    fill_in "Email", with: @user.email
    click_button "Reset password"
    assert page.body.include?("Email sent with password reset instructions.")
    
    # The e-mail part
    mail = ActionMailer::Base.deliveries.last
    assert "from@example.com" == mail["from"].to_s
    assert @user.email == mail["to"].to_s
    assert "Password Reset" == mail["subject"].to_s
    body = mail.body.to_s
    url = URI.extract(body).first
    
    visit url
    fill_in "user_password", with: "new_password!"
    fill_in "user_password_confirmation", with: "missmatch!!!"
    click_button "Update password"
    assert page.body.include?("Form is invalid")
  end

  test "Reset password failing because of expiration" do
    visit "/login"
    click_link "Forgot your password?"
    fill_in "Email", with: @user.email
    click_button "Reset password"
    assert page.body.include?("Email sent with password reset instructions.")
    
    # The e-mail part
    mail = ActionMailer::Base.deliveries.last
    assert "from@example.com" == mail["from"].to_s
    assert @user.email == mail["to"].to_s
    assert "Password Reset" == mail["subject"].to_s
    body = mail.body.to_s
    url = URI.extract(body).first
    
    # Travel forward in time
    Timecop.freeze(Date.today + 2) do
      visit url
      fill_in "user_password", with: "new_password!"
      fill_in "user_password_confirmation", with: "new_password!"
      click_button "Update password"
      assert page.body.include?("Password reset has expired.")
    end

  end
end