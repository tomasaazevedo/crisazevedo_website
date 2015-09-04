require 'rails_helper'

RSpec.describe "collection_images/edit", :type => :view do
  before(:each) do
    @collection_image = assign(:collection_image, CollectionImage.create!(
      :collection_image => ""
    ))
  end

  it "renders the edit collection_image form" do
    render

    assert_select "form[action=?][method=?]", collection_image_path(@collection_image), "post" do

      assert_select "input#collection_image_collection_image[name=?]", "collection_image[collection_image]"
    end
  end
end
