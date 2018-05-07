class DonorProfile < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    validates :donor_id, :first_name, :last_name, :street_line_one, :suburb, :postcode, :state, :country, presence: true
    belongs_to :donor
end
