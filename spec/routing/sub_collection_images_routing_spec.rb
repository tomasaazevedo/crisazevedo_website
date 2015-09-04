require "rails_helper"

RSpec.describe SubCollectionImagesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sub_collection_images").to route_to("sub_collection_images#index")
    end

    it "routes to #new" do
      expect(:get => "/sub_collection_images/new").to route_to("sub_collection_images#new")
    end

    it "routes to #show" do
      expect(:get => "/sub_collection_images/1").to route_to("sub_collection_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sub_collection_images/1/edit").to route_to("sub_collection_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sub_collection_images").to route_to("sub_collection_images#create")
    end

    it "routes to #update" do
      expect(:put => "/sub_collection_images/1").to route_to("sub_collection_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sub_collection_images/1").to route_to("sub_collection_images#destroy", :id => "1")
    end

  end
end
