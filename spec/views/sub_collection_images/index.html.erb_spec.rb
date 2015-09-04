require 'rails_helper'

RSpec.describe "sub_collection_images/index", :type => :view do
  before(:each) do
    assign(:sub_collection_images, [
      SubCollectionImage.create!(
        :sub_collection_image => ""
      ),
      SubCollectionImage.create!(
        :sub_collection_image => ""
      )
    ])
  end

  it "renders a list of sub_collection_images" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
