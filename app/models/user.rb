class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # :confirmable

  #Validation
  # Overwriting Devise method
  validates_presence_of :name, if: :name_required?
  validates_uniqueness_of :name

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :questionLikes
  has_many :questions, through: :questionLikes
  has_many :answerLikes
  has_many :answers, through: :answerLikes

private

  def name_required?
    true
  end

end
