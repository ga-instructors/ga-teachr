require 'rails_helper'

RSpec.describe "Groups::Groupings", type: :request do
  describe "GET /groups_groupings" do
    it "works! (now write some real specs)" do
      get groups_groupings_path
      expect(response).to have_http_status(200)
    end
  end
end
