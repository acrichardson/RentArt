class RemoveDateFromRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :date, :date
  end
end
