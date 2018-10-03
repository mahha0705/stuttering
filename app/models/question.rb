class Question < ApplicationRecord

  belongs_to :user
  has_many :answers
  has_many :question_likes
  has_many :users , through: :question_likes

  validates :genre, presence: true
  validates :title, presence: true
  validates :body, presence: true

  enum genre: { school: 0, work: 1, job_hunting: 2, relationship: 3, other: 10, }


end
