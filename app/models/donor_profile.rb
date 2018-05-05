class DonorProfile < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
    belongs_to :donor
end
