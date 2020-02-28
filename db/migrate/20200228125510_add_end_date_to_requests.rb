class AddEndDateToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :end_date, :date
  end
end
