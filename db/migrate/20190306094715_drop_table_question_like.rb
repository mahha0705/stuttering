class DropTableQuestionLike < ActiveRecord::Migration[5.2]
  def change
    drop_table :question_likes
  end
end
