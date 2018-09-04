class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
     t.references :question,       null: false, foreign_key: true
     t.references :user,           null: false, foreign_key: true
     t.string :title,              null: false
     t.text :body,                 null: false
     t.timestamps                  null: false
    end
  end
end
