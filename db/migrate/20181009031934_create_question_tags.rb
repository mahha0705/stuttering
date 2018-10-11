class CreateQuestionTags < ActiveRecord::Migration[5.2]
  def change
    create_table :question_tags do |t|
     t.references :question,        null: false, foreign_key: true
     t.integer :tag,          default: 0, null: false, limit: 1
     t.timestamps null: false
    end
  end
end
