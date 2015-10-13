require "rails_helper"

RSpec.describe Survey::EvaluationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/survey/evaluations").to route_to("survey/evaluations#index")
    end

    it "routes to #new" do
      expect(:get => "/survey/evaluations/new").to route_to("survey/evaluations#new")
    end

    it "routes to #show" do
      expect(:get => "/survey/evaluations/1").to route_to("survey/evaluations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/survey/evaluations/1/edit").to route_to("survey/evaluations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/survey/evaluations").to route_to("survey/evaluations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/survey/evaluations/1").to route_to("survey/evaluations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/survey/evaluations/1").to route_to("survey/evaluations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/survey/evaluations/1").to route_to("survey/evaluations#destroy", :id => "1")
    end

  end
end
