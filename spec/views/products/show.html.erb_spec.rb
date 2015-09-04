require 'rails_helper'

RSpec.describe "products/show", :type => :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :name => "Name",
      :description => "MyText",
      :dimensions => "Dimensions",
      :weight => "Weight",
      :material => "Material",
      :product_code => "Product Code",
      :is_new_release => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Dimensions/)
    expect(rendered).to match(/Weight/)
    expect(rendered).to match(/Material/)
    expect(rendered).to match(/Product Code/)
    expect(rendered).to match(/false/)
  end
end
