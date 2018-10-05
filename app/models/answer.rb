class Answer < ApplicationRecord

  belongs_to :user
  belongs_to :question
  has_many :answer_likes
  has_many :users , through: :answer_likes

  validates :title, presence: true
  validates :body, presence: true

end
