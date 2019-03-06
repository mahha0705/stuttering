# frozen_string_literal: true

# == Schema Information
#
# Table name: question_tags
#
#  id          :bigint(8)        not null, primary key
#  question_id :bigint(8)        not null
#  tag         :integer          default("school"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class QuestionTag < ApplicationRecord
  belongs_to :question

  enum tag: {
    school: 0,
    work: 1,
    job_hunting: 2,
    relationship: 3,
    improvement: 4,
    hospital: 5,
    other: 10
  }
end
