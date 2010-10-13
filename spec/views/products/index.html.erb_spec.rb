require 'spec_helper'

describe "products/index.html.erb" do
  before(:each) do
    assign(:products, [
      stub_model(Product,
        :name => "Name"
      ),
      stub_model(Product,
        :name => "Name"
      )
    ])
  end

  it "renders a list of products" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
  end
end
