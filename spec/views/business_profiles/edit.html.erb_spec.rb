require 'rails_helper'

RSpec.describe "business_profiles/edit", type: :view do
  before(:each) do
    @business_profile = assign(:business_profile, BusinessProfile.create!(
      :business => nil,
      :name => "MyString",
      :about => "MyText",
      :street_line_one => "MyString",
      :street_line_two => "MyString",
      :suburb => "MyString",
      :postcode => "MyString",
      :state => "MyString",
      :country => "MyString",
      :address_notes => "MyText",
      :avatar => "MyString",
      :abn => "MyString",
      :contact_first_name => "MyString",
      :contact_last_name => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders the edit business_profile form" do
    render

    assert_select "form[action=?][method=?]", business_profile_path(@business_profile), "post" do

      assert_select "input[name=?]", "business_profile[business_id]"

      assert_select "input[name=?]", "business_profile[name]"

      assert_select "textarea[name=?]", "business_profile[about]"

      assert_select "input[name=?]", "business_profile[street_line_one]"

      assert_select "input[name=?]", "business_profile[street_line_two]"

      assert_select "input[name=?]", "business_profile[suburb]"

      assert_select "input[name=?]", "business_profile[postcode]"

      assert_select "input[name=?]", "business_profile[state]"

      assert_select "input[name=?]", "business_profile[country]"

      assert_select "textarea[name=?]", "business_profile[address_notes]"

      assert_select "input[name=?]", "business_profile[avatar]"

      assert_select "input[name=?]", "business_profile[abn]"

      assert_select "input[name=?]", "business_profile[contact_first_name]"

      assert_select "input[name=?]", "business_profile[contact_last_name]"

      assert_select "input[name=?]", "business_profile[phone]"
    end
  end
end
