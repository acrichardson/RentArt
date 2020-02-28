class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :reviews, through: :reservations

  CATEGORY = %w[Plane Helicopter Yacht Car Other].freeze

  validates :name, :details, :category, :price, presence: true
  validates :category, inclusion: { in: CATEGORY }

  include PgSearch::Model
    pg_search_scope :search_by_name_and_details,
    against: [ :name, :details ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

   geocoded_by :address
   after_validation :geocode, if: :will_save_change_to_address?
end
