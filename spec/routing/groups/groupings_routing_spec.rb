require "rails_helper"

RSpec.describe Groups::GroupingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/groups/groupings").to route_to("groups/groupings#index")
    end

    it "routes to #new" do
      expect(:get => "/groups/groupings/new").to route_to("groups/groupings#new")
    end

    it "routes to #show" do
      expect(:get => "/groups/groupings/1").to route_to("groups/groupings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/groups/groupings/1/edit").to route_to("groups/groupings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/groups/groupings").to route_to("groups/groupings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/groups/groupings/1").to route_to("groups/groupings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/groups/groupings/1").to route_to("groups/groupings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/groups/groupings/1").to route_to("groups/groupings#destroy", :id => "1")
    end

  end
end
