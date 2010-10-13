require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :email => "Email",
      :password => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Email".to_s)
    rendered.should contain("".to_s)
  end
end
