require 'rails_helper'

RSpec.describe "donor_profiles/show", type: :view do
  before(:each) do
    @donor_profile = assign(:donor_profile, DonorProfile.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Avatar/)
    expect(rendered).to match(/Street Line One/)
    expect(rendered).to match(/Street Line Two/)
    expect(rendered).to match(/Suburb/)
    expect(rendered).to match(/Postcode/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Phone Number/)
  end
end
