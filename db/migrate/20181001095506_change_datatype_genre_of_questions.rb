class ChangeDatatypeGenreOfQuestions < ActiveRecord::Migration[5.2]
  def change

    change_column :questions, :genre, :integer, default: 0, null: false, limit: 1

  end
end
