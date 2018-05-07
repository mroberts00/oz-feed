class BusinessProfile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :business
  validates :business_id, :name, :street_line_one, :suburb, :postcode, :state, :country, :abn,   presence: true

end
