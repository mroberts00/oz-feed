require "rails_helper"

RSpec.describe DonorProfilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/donor_profiles").to route_to("donor_profiles#index")
    end

    it "routes to #new" do
      expect(:get => "/donor_profiles/new").to route_to("donor_profiles#new")
    end

    it "routes to #show" do
      expect(:get => "/donor_profiles/1").to route_to("donor_profiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/donor_profiles/1/edit").to route_to("donor_profiles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/donor_profiles").to route_to("donor_profiles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/donor_profiles/1").to route_to("donor_profiles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/donor_profiles/1").to route_to("donor_profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/donor_profiles/1").to route_to("donor_profiles#destroy", :id => "1")
    end

  end
end
