class AddColumnsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :to, :string
    add_column :requests, :recipients, :string, array: true, default: []
    add_column :requests, :due, :date
    add_column :requests, :status, :string
    add_column :requests, :priority, :string
    add_column :requests, :cost_impact, :string
    add_column :requests, :trade, :string
  end
end
