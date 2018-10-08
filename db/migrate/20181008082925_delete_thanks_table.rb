class DeleteThanksTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :thanks
  end
end
