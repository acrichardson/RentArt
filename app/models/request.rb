class Request < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :start_date, :end_date, presence: true, availability: true
  validate :end_date_after_start_date

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
  #it should be has_one review if belongs
  # to is used it will require a review