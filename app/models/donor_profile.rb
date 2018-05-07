class DonorProfile < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    validates :donor_id, presence: true
    belongs_to :donor
end
