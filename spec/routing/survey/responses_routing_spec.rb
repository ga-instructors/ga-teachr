require "rails_helper"

RSpec.describe Survey::ResponsesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/survey/responses").to route_to("survey/responses#index")
    end

    it "routes to #new" do
      expect(:get => "/survey/responses/new").to route_to("survey/responses#new")
    end

    it "routes to #show" do
      expect(:get => "/survey/responses/1").to route_to("survey/responses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/survey/responses/1/edit").to route_to("survey/responses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/survey/responses").to route_to("survey/responses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/survey/responses/1").to route_to("survey/responses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/survey/responses/1").to route_to("survey/responses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/survey/responses/1").to route_to("survey/responses#destroy", :id => "1")
    end

  end
end
