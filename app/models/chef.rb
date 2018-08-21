class Chef < ApplicationRecord
  has_many :specialties
  has_many :menus
  has_many :bookings, through: :menus, dependent: :destroy

  validates :experience, numericality: { only_integer: true }
  validates :email, format: { with: /^.+@.+\..+$/, message: "Must be a valid email." }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
