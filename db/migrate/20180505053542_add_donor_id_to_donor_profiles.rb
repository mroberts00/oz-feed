class AddDonorIdToDonorProfiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :donor_profiles, :donor, foreign_key: true
  end
end
