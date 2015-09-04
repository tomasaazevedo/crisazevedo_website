require 'rails_helper'

RSpec.describe "collection_images/new", :type => :view do
  before(:each) do
    assign(:collection_image, CollectionImage.new(
      :collection_image => ""
    ))
  end

  it "renders new collection_image form" do
    render

    assert_select "form[action=?][method=?]", collection_images_path, "post" do

      assert_select "input#collection_image_collection_image[name=?]", "collection_image[collection_image]"
    end
  end
end
