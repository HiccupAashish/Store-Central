class AddOmniauthToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :omniauth, :boolean
  end
end
