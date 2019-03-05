# == Schema Information
#
# Table name: notifications
#
#  id             :bigint(8)        not null, primary key
#  user_id        :bigint(8)
#  notified_by_id :bigint(8)
#  question_id    :bigint(8)
#  notified_type  :string
#  read           :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notified_by, class_name: 'User'
  belongs_to :question
end
