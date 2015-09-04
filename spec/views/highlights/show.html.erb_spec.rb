require 'rails_helper'

RSpec.describe "highlights/show", :type => :view do
  before(:each) do
    @highlight = assign(:highlight, Highlight.create!(
      :title => "Title",
      :details => "Details",
      :link => "Link",
      :is_active => false,
      :image => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Details/)
    expect(rendered).to match(/Link/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
