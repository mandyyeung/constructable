class RemovePrimaryFromResponses < ActiveRecord::Migration
  def change
    remove_column :responses, :primary, :boolean
  end
end
