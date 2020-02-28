class AddStartDateToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :start_date, :date
  end
end
