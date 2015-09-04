require 'rails_helper'

RSpec.describe "collection_images/index", :type => :view do
  before(:each) do
    assign(:collection_images, [
      CollectionImage.create!(
        :collection_image => ""
      ),
      CollectionImage.create!(
        :collection_image => ""
      )
    ])
  end

  it "renders a list of collection_images" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
