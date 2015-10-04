require "rails_helper"

RSpec.describe Survey::QuestionnairesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/survey/questionnaires").to route_to("survey/questionnaires#index")
    end

    it "routes to #new" do
      expect(:get => "/survey/questionnaires/new").to route_to("survey/questionnaires#new")
    end

    it "routes to #show" do
      expect(:get => "/survey/questionnaires/1").to route_to("survey/questionnaires#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/survey/questionnaires/1/edit").to route_to("survey/questionnaires#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/survey/questionnaires").to route_to("survey/questionnaires#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/survey/questionnaires/1").to route_to("survey/questionnaires#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/survey/questionnaires/1").to route_to("survey/questionnaires#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/survey/questionnaires/1").to route_to("survey/questionnaires#destroy", :id => "1")
    end

  end
end
