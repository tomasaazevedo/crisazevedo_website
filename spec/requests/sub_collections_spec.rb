require 'rails_helper'

RSpec.describe "SubCollections", :type => :request do
  describe "GET /sub_collections" do
    it "works! (now write some real specs)" do
      get sub_collections_path
      expect(response).to have_http_status(200)
    end
  end
end
