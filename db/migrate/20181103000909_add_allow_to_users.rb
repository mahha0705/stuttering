class AddAllowToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :display_allowed, :boolean ,default: true, null: false , :after => :avatar
  end
end
