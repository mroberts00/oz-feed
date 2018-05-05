require 'rails_helper'

RSpec.describe "DonorProfiles", type: :request do
  describe "GET /donor_profiles" do
    it "works! (now write some real specs)" do
      get donor_profiles_path
      expect(response).to have_http_status(200)
    end
  end
end
