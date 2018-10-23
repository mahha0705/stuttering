class QuestionComment < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
end
