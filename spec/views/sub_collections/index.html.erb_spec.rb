require 'rails_helper'

RSpec.describe "sub_collections/index", :type => :view do
  before(:each) do
    assign(:sub_collections, [
      SubCollection.create!(
        :name => "Name",
        :description => "MyText"
      ),
      SubCollection.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of sub_collections" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
