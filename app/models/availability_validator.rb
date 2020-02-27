class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(reservation, attribute, value)
    reservations = Reservation.where(["product_id =?", reservation.product_id])
    date_ranges = reservations.map { |b| b.start_date..b.end_date }

    date_ranges.each do |range|
      if range.include? value
        reservation.errors.add(attribute, "not available")
      end
    end
  end

  def unavailable_dates
    reservations.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
