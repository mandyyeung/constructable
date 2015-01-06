class UpdateResponses < ActiveRecord::Migration
  def change
    remove_column :responses, :primary, :boolean
    add_column :responses, :opened, :date
  end
end
