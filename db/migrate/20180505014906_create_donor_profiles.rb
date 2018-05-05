class CreateDonorProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :donor_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :avatar
      t.string :street_line_one
      t.string :street_line_two
      t.string :suburb
      t.string :postcode
      t.string :state, default: "NSW"
      t.string :country, default: "Australia"
      t.string :phone_number

      t.timestamps
    end
  end
end
