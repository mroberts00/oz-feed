class AddProfileIdToDonors < ActiveRecord::Migration[5.2]
  def change
    add_reference :donors, :donor_profile, foreign_key: true
  end
end
