class QuestionTag < ApplicationRecord
  belongs_to :question

  enum tag: { school: 0, work: 1, job_hunting: 2, relationship: 3,
improvement: 4, hospital: 5, other: 10, }

end
