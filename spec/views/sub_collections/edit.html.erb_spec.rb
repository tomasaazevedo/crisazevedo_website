require 'rails_helper'

RSpec.describe "sub_collections/edit", :type => :view do
  before(:each) do
    @sub_collection = assign(:sub_collection, SubCollection.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit sub_collection form" do
    render

    assert_select "form[action=?][method=?]", sub_collection_path(@sub_collection), "post" do

      assert_select "input#sub_collection_name[name=?]", "sub_collection[name]"

      assert_select "textarea#sub_collection_description[name=?]", "sub_collection[description]"
    end
  end
end
