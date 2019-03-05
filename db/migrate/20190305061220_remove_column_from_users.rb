class RemoveColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :avatar, :string
    remove_column :users, :uid, :string
    remove_column :users, :provider, :string
  end
end
