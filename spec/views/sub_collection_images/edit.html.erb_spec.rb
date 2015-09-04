require 'rails_helper'

RSpec.describe "sub_collection_images/edit", :type => :view do
  before(:each) do
    @sub_collection_image = assign(:sub_collection_image, SubCollectionImage.create!(
      :sub_collection_image => ""
    ))
  end

  it "renders the edit sub_collection_image form" do
    render

    assert_select "form[action=?][method=?]", sub_collection_image_path(@sub_collection_image), "post" do

      assert_select "input#sub_collection_image_sub_collection_image[name=?]", "sub_collection_image[sub_collection_image]"
    end
  end
end
