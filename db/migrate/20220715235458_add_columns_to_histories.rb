class AddColumnsToHistories < ActiveRecord::Migration[6.1]
  def change
    add_column :histories, :gross_profit, :integer
    add_column :histories, :item_sold, :integer
  end
end
