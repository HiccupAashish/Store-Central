class AddProductAndQuantityToHistory < ActiveRecord::Migration[6.1]
  def change
    add_column :histories, :product, :string
    add_column :histories, :quantity, :string
  end
end
