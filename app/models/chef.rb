class Chef < ApplicationRecord


  has_many :menus
  has_many :bookings, through: :menus, dependent: :destroy

  validates :experience, numericality: { only_integer: true, message: "Experience must be a number." }

  include PgSearch

  pg_search_scope :global_search,
    against: [ :first_name, :last_name, :specialty, :location ],
    associated_against: {
      menus: [ :description ]
    },
    using: {
      tsearch: { prefix: true }
    }

  # Devise does this, we think.
  # validates :email, format: { with: /^.+@.+\..+$/, message: "Must be a valid email." }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo_id, PhotoUploader



end
