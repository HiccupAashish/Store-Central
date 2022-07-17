class AddCustomToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :custom, :boolean
  end
end
