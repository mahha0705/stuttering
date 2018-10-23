class CreateQuestionComments < ActiveRecord::Migration[5.2]
  def change
    create_table :question_comments do |t|
      t.references :question, index: true,null: false, foreign_key: true
      t.text :body ,null: false
      t.timestamps
    end
  end
end
