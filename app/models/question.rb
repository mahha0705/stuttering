class Question < ApplicationRecord

  belongs_to :user
  has_many :answers
  has_many :question_likes
  has_many :users , through: :question_likes

end
