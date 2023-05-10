class RemovePriceAndQuantityFromCart < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :price, :string
    remove_column :carts, :quantity, :string
  end
end
