class ChangeReviewAndReservationReferences < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reservations, :review, index: true, foreign_key: true
    add_reference :reviews, :reservation, index: true, foreign_key: true
  end
end
