require "rails_helper"

RSpec.describe SubCollectionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sub_collections").to route_to("sub_collections#index")
    end

    it "routes to #new" do
      expect(:get => "/sub_collections/new").to route_to("sub_collections#new")
    end

    it "routes to #show" do
      expect(:get => "/sub_collections/1").to route_to("sub_collections#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sub_collections/1/edit").to route_to("sub_collections#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sub_collections").to route_to("sub_collections#create")
    end

    it "routes to #update" do
      expect(:put => "/sub_collections/1").to route_to("sub_collections#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sub_collections/1").to route_to("sub_collections#destroy", :id => "1")
    end

  end
end
