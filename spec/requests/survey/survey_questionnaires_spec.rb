require 'rails_helper'

RSpec.describe "Survey::Questionnaires", type: :request do
  describe "GET /survey_questionnaires" do
    it "works! (now write some real specs)" do
      get survey_questionnaires_path
      expect(response).to have_http_status(200)
    end
  end
end
