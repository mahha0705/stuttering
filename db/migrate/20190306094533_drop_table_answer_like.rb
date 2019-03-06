class DropTableAnswerLike < ActiveRecord::Migration[5.2]
  def change
    drop_table :answer_likes
  end
end
