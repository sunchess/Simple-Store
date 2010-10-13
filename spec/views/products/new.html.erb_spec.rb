require 'spec_helper'

describe "products/new.html.erb" do
  before(:each) do
    assign(:product, stub_model(Product,
      :new_record? => true,
      :name => "MyString"
    ))
  end

  it "renders new product form" do
    render

    rendered.should have_selector("form", :action => products_path, :method => "post") do |form|
      form.should have_selector("input#product_name", :name => "product[name]")
    end
  end
end
