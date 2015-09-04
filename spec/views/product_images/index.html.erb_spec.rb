require 'rails_helper'

RSpec.describe "product_images/index", :type => :view do
  before(:each) do
    assign(:product_images, [
      ProductImage.create!(
        :product_image => ""
      ),
      ProductImage.create!(
        :product_image => ""
      )
    ])
  end

  it "renders a list of product_images" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
