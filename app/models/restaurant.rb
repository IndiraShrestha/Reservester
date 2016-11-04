class Restaurant < ApplicationRecord
  belongs_to :user
  mount_uploader :image, RestaurantImageUploader
  validates :name, presence: true
end
