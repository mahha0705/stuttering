# == Schema Information
#
# Table name: question_comments
#
#  id          :bigint(8)        not null, primary key
#  question_id :bigint(8)        not null
#  body        :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class QuestionComment < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
end
