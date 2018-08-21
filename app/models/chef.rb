class Chef < ApplicationRecord
  has_many :specialties
  has_many :menus
  has_many :bookings, through: :menus, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo_id, PhotoUploader

end
