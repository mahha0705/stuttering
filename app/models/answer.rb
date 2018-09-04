class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :thank
  has_many :answer_likes
  has_many :users , through: :answer_likes
end
