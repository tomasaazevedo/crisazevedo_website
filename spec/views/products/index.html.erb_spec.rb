require 'rails_helper'

RSpec.describe "products/index", :type => :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :name => "Name",
        :description => "MyText",
        :dimensions => "Dimensions",
        :weight => "Weight",
        :material => "Material",
        :product_code => "Product Code",
        :is_new_release => false
      ),
      Product.create!(
        :name => "Name",
        :description => "MyText",
        :dimensions => "Dimensions",
        :weight => "Weight",
        :material => "Material",
        :product_code => "Product Code",
        :is_new_release => false
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Dimensions".to_s, :count => 2
    assert_select "tr>td", :text => "Weight".to_s, :count => 2
    assert_select "tr>td", :text => "Material".to_s, :count => 2
    assert_select "tr>td", :text => "Product Code".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
