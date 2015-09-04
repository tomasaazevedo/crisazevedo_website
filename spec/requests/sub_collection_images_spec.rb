require 'rails_helper'

RSpec.describe "SubCollectionImages", :type => :request do
  describe "GET /sub_collection_images" do
    it "works! (now write some real specs)" do
      get sub_collection_images_path
      expect(response).to have_http_status(200)
    end
  end
end
