class AddPrimaryToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :primary, :boolean, default: false
  end
end
