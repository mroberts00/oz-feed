require 'rails_helper'

RSpec.describe "business_profiles/index", type: :view do
  before(:each) do
    assign(:business_profiles, [
      BusinessProfile.create!(
        :business => nil,
        :name => "Name",
        :about => "MyText",
        :street_line_one => "Street Line One",
        :street_line_two => "Street Line Two",
        :suburb => "Suburb",
        :postcode => "Postcode",
        :state => "State",
        :country => "Country",
        :address_notes => "MyText",
        :avatar => "Avatar",
        :abn => "Abn",
        :contact_first_name => "Contact First Name",
        :contact_last_name => "Contact Last Name",
        :phone => "Phone"
      ),
      BusinessProfile.create!(
        :business => nil,
        :name => "Name",
        :about => "MyText",
        :street_line_one => "Street Line One",
        :street_line_two => "Street Line Two",
        :suburb => "Suburb",
        :postcode => "Postcode",
        :state => "State",
        :country => "Country",
        :address_notes => "MyText",
        :avatar => "Avatar",
        :abn => "Abn",
        :contact_first_name => "Contact First Name",
        :contact_last_name => "Contact Last Name",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of business_profiles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Street Line One".to_s, :count => 2
    assert_select "tr>td", :text => "Street Line Two".to_s, :count => 2
    assert_select "tr>td", :text => "Suburb".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
    assert_select "tr>td", :text => "Abn".to_s, :count => 2
    assert_select "tr>td", :text => "Contact First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
