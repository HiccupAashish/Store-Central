class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :post, :title
  end
end
