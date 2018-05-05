require 'rails_helper'

RSpec.describe "donor_profiles/index", type: :view do
  before(:each) do
    assign(:donor_profiles, [
      DonorProfile.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :avatar => "Avatar",
        :street_line_one => "Street Line One",
        :street_line_two => "Street Line Two",
        :suburb => "Suburb",
        :postcode => "Postcode",
        :state => "State",
        :country => "Country",
        :phone_number => "Phone Number"
      ),
      DonorProfile.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :avatar => "Avatar",
        :street_line_one => "Street Line One",
        :street_line_two => "Street Line Two",
        :suburb => "Suburb",
        :postcode => "Postcode",
        :state => "State",
        :country => "Country",
        :phone_number => "Phone Number"
      )
    ])
  end

  it "renders a list of donor_profiles" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Avatar".to_s, :count => 2
    assert_select "tr>td", :text => "Street Line One".to_s, :count => 2
    assert_select "tr>td", :text => "Street Line Two".to_s, :count => 2
    assert_select "tr>td", :text => "Suburb".to_s, :count => 2
    assert_select "tr>td", :text => "Postcode".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
  end
end
