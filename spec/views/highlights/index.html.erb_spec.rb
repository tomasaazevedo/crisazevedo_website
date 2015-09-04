require 'rails_helper'

RSpec.describe "highlights/index", :type => :view do
  before(:each) do
    assign(:highlights, [
      Highlight.create!(
        :title => "Title",
        :details => "Details",
        :link => "Link",
        :is_active => false,
        :image => ""
      ),
      Highlight.create!(
        :title => "Title",
        :details => "Details",
        :link => "Link",
        :is_active => false,
        :image => ""
      )
    ])
  end

  it "renders a list of highlights" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Details".to_s, :count => 2
    assert_select "tr>td", :text => "Link".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
