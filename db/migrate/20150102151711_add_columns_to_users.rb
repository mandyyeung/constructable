class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company, :string
    add_column :users, :avatar, :string
    add_column :users, :trade, :string
  end
end
