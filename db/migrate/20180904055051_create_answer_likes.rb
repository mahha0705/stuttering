class CreateAnswerLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_likes do |t|
     t.references :user,            null: false, foreign_key: true
     t.references :answer,          null: false, foreign_key: true
     t.timestamps null: false
    end
  end
end
