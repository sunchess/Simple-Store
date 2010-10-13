require 'spec_helper'

describe "products/edit.html.erb" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    rendered.should have_selector("form", :action => product_path(@product), :method => "post") do |form|
      form.should have_selector("input#product_name", :name => "product[name]")
    end
  end
end
