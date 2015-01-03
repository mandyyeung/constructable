class AddOpenedToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :opened, :date
  end
end
