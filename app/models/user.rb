class User < ApplicationRecord

  has_many :rooms
  has_many :reservations

  mount_uploader :profile_image, ImageUploader

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
