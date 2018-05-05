require "rails_helper"

RSpec.describe BusinessProfilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/business_profiles").to route_to("business_profiles#index")
    end

    it "routes to #new" do
      expect(:get => "/business_profiles/new").to route_to("business_profiles#new")
    end

    it "routes to #show" do
      expect(:get => "/business_profiles/1").to route_to("business_profiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/business_profiles/1/edit").to route_to("business_profiles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/business_profiles").to route_to("business_profiles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/business_profiles/1").to route_to("business_profiles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/business_profiles/1").to route_to("business_profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/business_profiles/1").to route_to("business_profiles#destroy", :id => "1")
    end

  end
end
