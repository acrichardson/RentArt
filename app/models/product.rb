class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :reservations
  has_many :reviews, through: :reservations

  CATEGORY = %w[Plane Helicopter Yacht Car Other].freeze

  validates :name, :details, :category, :price, presence: true
  validates :category, inclusion: { in: CATEGORY }
end
