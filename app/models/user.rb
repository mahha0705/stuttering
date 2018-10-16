class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # :confirmable
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :questionLikes
  has_many :questions, through: :questionLikes
  has_many :answerLikes
  has_many :answers, through: :answerLikes
  has_many :notifications, dependent: :destroy

end
