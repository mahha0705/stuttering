# == Schema Information
#
# Table name: answer_likes
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)        not null
#  answer_id  :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AnswerLike < ApplicationRecord
  belongs_to :user
  belongs_to :answer
end
