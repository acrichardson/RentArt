class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :reservations
  has_many :reviews, through: :reservations

  CATEGORY = %w[plane helicopter boat car other].freeze

  validates :name, :details, :category, presence: true
  validates :category, inclusion: { in: CATEGORY }
end
