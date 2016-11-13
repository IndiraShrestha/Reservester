class Restaurant < ApplicationRecord

  mount_uploader :image, RestaurantImageUploader
  belongs_to :user

  has_many :reservation
  accepts_nested_attributes_for :reservation

  validates :name, presence: true
end
