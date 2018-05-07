class RemoveDonorProfileFromDonors < ActiveRecord::Migration[5.2]
  def change
    remove_reference :donors, :donor_profile, foreign_key: true
  end
end
