class BusinessProfile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :business
end
