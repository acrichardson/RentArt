class Review < ApplicationRecord
  belongs_to :reservation
  has_one :product, through: :reservation
end
