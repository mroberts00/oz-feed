class CreateBusinessProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :business_profiles do |t|
      t.references :business, foreign_key: true
      t.string :name
      t.text :about
      t.string :street_line_one
      t.string :street_line_two
      t.string :suburb
      t.string :postcode
      t.string :state, default: 'NSW'
      t.string :country, default: 'Australia'
      t.text :address_notes
      t.string :avatar
      t.string :abn
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :phone

      t.timestamps
    end
  end
end
