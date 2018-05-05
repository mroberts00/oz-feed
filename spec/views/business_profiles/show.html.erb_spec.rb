require 'rails_helper'

RSpec.describe "business_profiles/show", type: :view do
  before(:each) do
    @business_profile = assign(:business_profile, BusinessProfile.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Street Line One/)
    expect(rendered).to match(/Street Line Two/)
    expect(rendered).to match(/Suburb/)
    expect(rendered).to match(/Postcode/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Avatar/)
    expect(rendered).to match(/Abn/)
    expect(rendered).to match(/Contact First Name/)
    expect(rendered).to match(/Contact Last Name/)
    expect(rendered).to match(/Phone/)
  end
end
