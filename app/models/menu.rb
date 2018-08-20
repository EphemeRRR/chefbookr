class Menu < ApplicationRecord
  belongs_to :chef
  has_many :bookings
end
