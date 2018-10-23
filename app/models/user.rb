class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # :omniauthable #SNS認証用
         # :confirmable #メール認証

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
  has_many :notifications, dependent: :destroy

  enum stuttering: { has_stuttering: 0, no_stuttering: 1, no_answer: 2 }
  enum gender: { male: 0, female: 1, other: 2, no_answer: 3 }
  enum age: { teens: 0, early_twenties: 1, late_twenties: 2, early_thirties: 3, late_thirties: 4, forties: 5, fifties: 6, sixties_more: 7, no_answer: 8 }

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email || User.dummy_email(auth)
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    # user.image = auth.info.image
     # assuming the user model has an image
    user.stuttering = "吃音の症状なし"
    # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end

private

  def name_required?
    true
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
