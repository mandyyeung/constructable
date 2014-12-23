class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
