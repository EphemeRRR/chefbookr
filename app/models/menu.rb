class Menu < ApplicationRecord
  belongs_to :chef
  has_many :bookings

  validates :category, inclusion: { in: ["Simple", "Classic", "Gourmet"] }

  mount_uploader :photo_id, PhotoUploader

end
