require 'rails_helper'

RSpec.describe "sub_collection_images/new", :type => :view do
  before(:each) do
    assign(:sub_collection_image, SubCollectionImage.new(
      :sub_collection_image => ""
    ))
  end

  it "renders new sub_collection_image form" do
    render

    assert_select "form[action=?][method=?]", sub_collection_images_path, "post" do

      assert_select "input#sub_collection_image_sub_collection_image[name=?]", "sub_collection_image[sub_collection_image]"
    end
  end
end
