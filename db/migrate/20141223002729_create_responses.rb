class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :request_id
      t.integer :user_id
      t.text :body

      t.timestamps null: false
    end
  end
end
