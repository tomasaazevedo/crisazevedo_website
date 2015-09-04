require 'rails_helper'

RSpec.describe "collection_images/show", :type => :view do
  before(:each) do
    @collection_image = assign(:collection_image, CollectionImage.create!(
      :collection_image => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
