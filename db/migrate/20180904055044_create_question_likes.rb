class CreateQuestionLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :question_likes do |t|
     t.references :user,            null: false, foreign_key: true
     t.references :question,        null: false, foreign_key: true
     t.timestamps                   null: false
    end
  end
end
