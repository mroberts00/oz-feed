require 'rails_helper'

RSpec.describe "donor_profiles/edit", type: :view do
  before(:each) do
    @donor_profile = assign(:donor_profile, DonorProfile.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :avatar => "MyString",
      :street_line_one => "MyString",
      :street_line_two => "MyString",
      :suburb => "MyString",
      :postcode => "MyString",
      :state => "MyString",
      :country => "MyString",
      :phone_number => "MyString"
    ))
  end

  it "renders the edit donor_profile form" do
    render

    assert_select "form[action=?][method=?]", donor_profile_path(@donor_profile), "post" do

      assert_select "input[name=?]", "donor_profile[first_name]"

      assert_select "input[name=?]", "donor_profile[last_name]"

      assert_select "input[name=?]", "donor_profile[avatar]"

      assert_select "input[name=?]", "donor_profile[street_line_one]"

      assert_select "input[name=?]", "donor_profile[street_line_two]"

      assert_select "input[name=?]", "donor_profile[suburb]"

      assert_select "input[name=?]", "donor_profile[postcode]"

      assert_select "input[name=?]", "donor_profile[state]"

      assert_select "input[name=?]", "donor_profile[country]"

      assert_select "input[name=?]", "donor_profile[phone_number]"
    end
  end
end
