require 'rails_helper'

RSpec.describe "products/edit", :type => :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "MyString",
      :description => "MyText",
      :dimensions => "MyString",
      :weight => "MyString",
      :material => "MyString",
      :product_code => "MyString",
      :is_new_release => false
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_name[name=?]", "product[name]"

      assert_select "textarea#product_description[name=?]", "product[description]"

      assert_select "input#product_dimensions[name=?]", "product[dimensions]"

      assert_select "input#product_weight[name=?]", "product[weight]"

      assert_select "input#product_material[name=?]", "product[material]"

      assert_select "input#product_product_code[name=?]", "product[product_code]"

      assert_select "input#product_is_new_release[name=?]", "product[is_new_release]"
    end
  end
end
