class AddColumnsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :brought_price, :integer
    add_column :products, :profit, :integer
  end
end
