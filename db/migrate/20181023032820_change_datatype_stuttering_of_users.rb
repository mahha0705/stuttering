class ChangeDatatypeStutteringOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :stuttering, :integer, default: 0
  end

  def down
    change_column :users, :stuttering, :string
  end
end
