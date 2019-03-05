# == Schema Information
#
# Table name: question_likes
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)        not null
#  question_id :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class QuestionLike < ApplicationRecord
  belongs_to :user
  belongs_to :question
end
