class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :integer, default: 0 ,null: false, limit: 1, :after => :about
    add_column :users, :age, :integer, default: 0 ,null: false, limit: 1, :after => :gender
    change_column :users, :avatar, :string ,:after => :age
  end
end

