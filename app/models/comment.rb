# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  answer_id  :bigint(8)        not null
#  user_id    :bigint(8)        not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :answer
end
