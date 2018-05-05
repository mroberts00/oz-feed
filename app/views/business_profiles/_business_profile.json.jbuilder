json.extract! business_profile, :id, :business_id, :name, :about, :street_line_one, :street_line_two, :suburb, :postcode, :state, :country, :address_notes, :avatar, :abn, :contact_first_name, :contact_last_name, :phone, :created_at, :updated_at
json.url business_profile_url(business_profile, format: :json)
