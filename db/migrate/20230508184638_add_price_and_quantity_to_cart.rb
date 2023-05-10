class AddPriceAndQuantityToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :price, :integer
    add_column :carts, :quantity, :integer
  end
end
