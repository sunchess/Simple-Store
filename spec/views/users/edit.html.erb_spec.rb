require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :new_record? => false,
      :email => "MyString",
      :password => ""
    ))
  end

  it "renders the edit user form" do
    render

    rendered.should have_selector("form", :action => user_path(@user), :method => "post") do |form|
      form.should have_selector("input#user_email", :name => "user[email]")
      form.should have_selector("input#user_password", :name => "user[password]")
    end
  end
end
