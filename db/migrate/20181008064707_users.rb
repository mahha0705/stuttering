class Users < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :old, :string
    remove_column :users, :sex, :string
    remove_column :users, :occupation, :string
    add_column :users, :avatar, :string
    remove_index :users, column: :name
    add_index    :users, :name, unique: true
  end
end
