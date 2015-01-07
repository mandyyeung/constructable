class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.belongs_to :request, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end

    remove_column :requests, :user_id, :string
    remove_column :requests, :recipients, :string
    add_column :requests, :from, :string
  end
end
