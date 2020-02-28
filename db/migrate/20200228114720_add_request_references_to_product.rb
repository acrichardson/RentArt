class AddRequestReferencesToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :request, foreign_key: true
  end
end
