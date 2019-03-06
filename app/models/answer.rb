# frozen_string_literal: true

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
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
  belongs_to :question
  has_many :comments, dependent: :destroy

  counter_culture :question, touch: true
end
