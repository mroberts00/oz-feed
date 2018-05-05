json.extract! donor_profile, :id, :first_name, :last_name, :avatar, :street_line_one, :street_line_two, :suburb, :postcode, :state, :country, :phone_number, :created_at, :updated_at
json.url donor_profile_url(donor_profile, format: :json)
