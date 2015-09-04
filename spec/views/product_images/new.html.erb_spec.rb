require 'rails_helper'

RSpec.describe "product_images/new", :type => :view do
  before(:each) do
    assign(:product_image, ProductImage.new(
      :product_image => ""
    ))
  end

  it "renders new product_image form" do
    render

    assert_select "form[action=?][method=?]", product_images_path, "post" do

      assert_select "input#product_image_product_image[name=?]", "product_image[product_image]"
    end
  end
end
