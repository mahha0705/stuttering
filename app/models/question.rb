class Question < ApplicationRecord

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :questionTags, dependent: :destroy
  has_many :questionComments, dependent: :destroy
  has_many :questionLikes, dependent: :destroy
  has_many :users , through: :questionLikes
  has_many :notifications, dependent: :destroy

  accepts_nested_attributes_for :questionTags
  validate :require_any_questionTags
  def require_any_questionTags
    errors.add(:base, :no_questionTag) if questionTags.blank?
  end
  # validates :questionTag, presence: true
  paginates_per 10

  validates :title, presence: true
  validates :body, presence: true

  scope :newest, -> { order("created_at DESC") }
  scope :school, -> { where(id: QuestionTag.select("question_id").where(tag: 0)) }
  scope :work, -> { where(id: QuestionTag.select("question_id").where(tag: 1)) }
  scope :job_hunting, -> { where(id: QuestionTag.select("question_id").where(tag: 2)) }
  scope :relationship, -> { where(id: QuestionTag.select("question_id").where(tag: 3)) }
  scope :improvement, -> { where(id: QuestionTag.select("question_id").where(tag: 4)) }
  scope :hospital, -> { where(id: QuestionTag.select("question_id").where(tag: 5)) }
  scope :other, -> { where(id: QuestionTag.select("question_id").where(tag: 10)) }
  scope :new_or_old, -> (time){ order(created_at: time) }
  scope :has_answers, -> { where.not(answers_count: 0) }
  scope :no_answers, -> { where(answers_count: 0) }
  scope :keyword_search, -> (keyword){where('title LIKE(?) OR body LIKE(?)', "%#{keyword}%","%#{keyword}%")}

  def self.select_tag_questions(tags,page)
    question_ids = QuestionTag.select("question_id").where(tag: tags)
    Question.where(id: question_ids).page(page)
  end
end
