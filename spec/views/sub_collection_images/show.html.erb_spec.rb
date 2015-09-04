require 'rails_helper'

RSpec.describe "sub_collection_images/show", :type => :view do
  before(:each) do
    @sub_collection_image = assign(:sub_collection_image, SubCollectionImage.create!(
      :sub_collection_image => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
