class Review < ApplicationRecord
  belongs_to :reservation
  has_one :product, through: :reservation

  validates :content, presence: true
  validates :stars, numericality: true, inclusion: { in: [0, 1, 2, 3, 4, 5] }

  def blank_stars
   5 - stars.to_i
  end

end
