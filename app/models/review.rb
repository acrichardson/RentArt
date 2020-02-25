class Review < ApplicationRecord
  has_one :reservation
  has_one :product, through: :reservation
end
