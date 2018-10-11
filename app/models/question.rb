class Question < ApplicationRecord

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :questionTags, dependent: :destroy
  has_many :question_likes, dependent: :destroy
  has_many :users , through: :question_likes
  accepts_nested_attributes_for :questionTags


  paginates_per 2

  validates :title, presence: true
  validates :body, presence: true

  scope :newest,       -> { order("created_at DESC") }
  scope :school,       -> { where(id: QuestionTag.select("question_id").where(tag: 0)) }
  scope :work,       -> { where(id: QuestionTag.select("question_id").where(tag: 1)) }
  scope :job_hunting,       -> { where(id: QuestionTag.select("question_id").where(tag: 2)) }
  scope :relationship,       -> { where(id: QuestionTag.select("question_id").where(tag: 3)) }
  scope :improvement,       -> { where(id: QuestionTag.select("question_id").where(tag: 4)) }
  scope :hospital,       -> { where(id: QuestionTag.select("question_id").where(tag: 5)) }
  scope :other,       -> { where(id: QuestionTag.select("question_id").where(tag: 10)) }


end
