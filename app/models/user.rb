# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  name                   :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  stuttering             :integer          default("has_stuttering")
#  about                  :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar                 :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  provider               :string
#  uid                    :string
#  gender                 :integer          default("male"), not null
#  age                    :integer          default("teens"), not null
#  display_allowed        :boolean          default(TRUE), not null
#

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
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

  # mount_uploader :avatar, ImageUploader

  enum stuttering: { has_stuttering: 0, no_stuttering: 1, stuttering_no_answer: 2 }
  enum gender: { male: 0, female: 1, other: 2, gender_no_answer: 3 }
  enum age: { teens: 0, early_twenties: 1, late_twenties: 2, early_thirties: 3, late_thirties: 4, forties: 5, fifties: 6, sixties_more: 7, age_no_answer: 8 }
end
