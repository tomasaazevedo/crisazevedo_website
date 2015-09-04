require 'rails_helper'

RSpec.describe "sub_collections/show", :type => :view do
  before(:each) do
    @sub_collection = assign(:sub_collection, SubCollection.create!(
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
