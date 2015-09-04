require 'rails_helper'

RSpec.describe "sub_collections/new", :type => :view do
  before(:each) do
    assign(:sub_collection, SubCollection.new(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new sub_collection form" do
    render

    assert_select "form[action=?][method=?]", sub_collections_path, "post" do

      assert_select "input#sub_collection_name[name=?]", "sub_collection[name]"

      assert_select "textarea#sub_collection_description[name=?]", "sub_collection[description]"
    end
  end
end
