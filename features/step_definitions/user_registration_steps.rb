def login
  @user ||= Factory(:user)
  visit login_path
  fill_in("user_session_email", :with => @user.email)
  fill_in("user_session_password", :with => @user.password)
  click_button(I18n.t('submit'))
end

Given /^I logged in$/ do
  login
end

And /^I logged in with email "([^"]*)" and password "([^"]*)"$/ do |arg1, arg2|
  visit login_path
  fill_in("user_session_email", :with => arg1)
  fill_in("user_session_password", :with => arg2)
  click_button(I18n.t('submit'))
end

Given /^I have no users$/ do
  User.delete_all
end
