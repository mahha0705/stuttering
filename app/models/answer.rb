# == Schema Information
#
# Table name: answers
#
#  id          :bigint(8)        not null, primary key
#  question_id :bigint(8)        not null
#  user_id     :bigint(8)        not null
#  title       :string           not null
#  body        :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ApplicationRecord

  belongs_to :user
  belongs_to :question
  has_many :comments, dependent: :destroy
  has_many :answer_likes, dependent: :destroy
  has_many :users , through: :answer_likes
  # has_many :notifications, dependent: :destroy

  counter_culture :question ,touch: true

  validates :title, presence: true
  validates :body, presence: true

end
