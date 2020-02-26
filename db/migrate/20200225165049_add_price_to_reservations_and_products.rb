class AddPriceToReservationsAndProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :price, :integer
    add_column :products, :price, :integer

  end
end
