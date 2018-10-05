class Question < ApplicationRecord

  belongs_to :user
  has_many :answers
  has_many :question_likes
  has_many :users , through: :question_likes

  paginates_per 10

  validates :genre, presence: true
  validates :title, presence: true
  validates :body, presence: true

  enum genre: { school: 0, work: 1, job_hunting: 2, relationship: 3, other: 10, }

  scope :newest,       -> { order("created_at DESC") }
  scope :school,       -> { where(genre: 0) }
  scope :work,         -> { where(genre: 1) }
  scope :job_hunting,  -> { where(genre: 2) }
  scope :relationship, -> { where(genre: 3) }
  scope :other,        -> { where(genre: 10) }

end
