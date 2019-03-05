class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         # :omniauthable #SNS認証用
         # :confirmable #メール認証
  #Validation
  # Overwriting Devise method
  validates :name, presence: true, if: :name_required?
  validates :name, uniqueness: true
  validates :stuttering, presence: true
  validates :age, presence: true
  validates :gender, presence: true

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :questionLikes, dependent: :destroy
  has_many :questions, through: :questionLikes
  has_many :answerLikes, dependent: :nullify
  has_many :answers, through: :answerLikes
  has_many :notifications, dependent: :destroy

  mount_uploader :avatar, ImageUploader

  enum stuttering: { has_stuttering: 0, no_stuttering: 1, stuttering_no_answer: 2 }
  enum gender: { male: 0, female: 1, other: 2, gender_no_answer: 3 }
  enum age: { teens: 0, early_twenties: 1, late_twenties: 2, early_thirties: 3, late_thirties: 4, forties: 5, fifties: 6, sixties_more: 7, age_no_answer: 8 }
end
