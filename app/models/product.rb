class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :reservations
  has_many :reviews, through: :reservations

  validates :name, :details, presence: true
end
