require 'rails_helper'

RSpec.describe "highlights/edit", :type => :view do
  before(:each) do
    @highlight = assign(:highlight, Highlight.create!(
      :title => "MyString",
      :details => "MyString",
      :link => "MyString",
      :is_active => false,
      :image => ""
    ))
  end

  it "renders the edit highlight form" do
    render

    assert_select "form[action=?][method=?]", highlight_path(@highlight), "post" do

      assert_select "input#highlight_title[name=?]", "highlight[title]"

      assert_select "input#highlight_details[name=?]", "highlight[details]"

      assert_select "input#highlight_link[name=?]", "highlight[link]"

      assert_select "input#highlight_is_active[name=?]", "highlight[is_active]"

      assert_select "input#highlight_image[name=?]", "highlight[image]"
    end
  end
end
