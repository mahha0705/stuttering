class Answer < ApplicationRecord

  belongs_to :user
  belongs_to :question
  has_many :comments, dependent: :destroy
  has_many :answer_likes, dependent: :destroy
  has_many :users , through: :answer_likes
  # has_many :notifications, dependent: :destroy

  counter_culture :question ,touch: true

  # validates :title, presence: true
  # validates :body, presence: true

end
