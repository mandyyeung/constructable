class UpdateUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.remove :first_name
      t.remove :last_name
      t.column :full_name, :string
      t.remove :company
      t.column :category, :string, default: 'GC Team'
      t.remove :trade
      t.change :avatar, :string, default: 'http://placehold.it/64x64'
    end
  end
end
