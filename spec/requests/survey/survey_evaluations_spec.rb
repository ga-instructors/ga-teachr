require 'rails_helper'

RSpec.describe "Survey::Evaluations", type: :request do
  describe "GET /survey_evaluations" do
    it "works! (now write some real specs)" do
      get survey_evaluations_path
      expect(response).to have_http_status(200)
    end
  end
end