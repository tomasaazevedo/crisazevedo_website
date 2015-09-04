require "rails_helper"

RSpec.describe CollectionImagesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/collection_images").to route_to("collection_images#index")
    end

    it "routes to #new" do
      expect(:get => "/collection_images/new").to route_to("collection_images#new")
    end

    it "routes to #show" do
      expect(:get => "/collection_images/1").to route_to("collection_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/collection_images/1/edit").to route_to("collection_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/collection_images").to route_to("collection_images#create")
    end

    it "routes to #update" do
      expect(:put => "/collection_images/1").to route_to("collection_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/collection_images/1").to route_to("collection_images#destroy", :id => "1")
    end

  end
end
