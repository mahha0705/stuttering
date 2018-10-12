class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # :confirmable

  #Validation
  # Overwriting Devise method
  validates_presence_of :name, if: :name_required?

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :question_likes
  has_many :questions, through: :question_likes
  has_many :answer_likes
  has_many :answers, through: :answer_likes

private

  def name_required?
    true
  end

end
