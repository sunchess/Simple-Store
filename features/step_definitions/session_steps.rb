def create_user(params = {})
 params[:password_confirmation] = params[:password]
 @user = User.find_by_email(params[:email]) || Factory(:user, params)
end

Given /^I registered user with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
  create_user({:email=>email, :password=>password})
end


