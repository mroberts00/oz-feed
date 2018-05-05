require 'rails_helper'

RSpec.describe "BusinessProfiles", type: :request do
  describe "GET /business_profiles" do
    it "works! (now write some real specs)" do
      get business_profiles_path
      expect(response).to have_http_status(200)
    end
  end
end
