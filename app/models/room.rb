class Room < ApplicationRecord

  belongs_to :user
  has_many :reservations , dependent: :destroy

  mount_uploader :room_image, RoomImageUploader

  validates :name, presence: true
  validates :information, presence: true
  validates :price, presence: true, numericality:{greater_than_or_equal_to: 1}
  validates :address, presence: true

end
