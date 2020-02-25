class Reservation < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :review
  #it should be has_one review if belongs
  # to is used it will require a review
end
