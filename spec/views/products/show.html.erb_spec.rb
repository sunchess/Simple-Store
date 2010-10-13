require 'spec_helper'

describe "products/show.html.erb" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
  end
end
