class Menu < ApplicationRecord
  belongs_to :chef
  has_many :bookings

  mount_uploader :photo_id, PhotoUploader

end
