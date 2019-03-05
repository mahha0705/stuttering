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
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  gender                 :integer          default("male"), not null
#  age                    :integer          default("teens"), not null
#  display_allowed        :boolean          default(TRUE), not null
#
FactoryBot.define do
  factory :user do
    name { "test" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "dottle-nouveau-pavilion-tights-furze" }
    age { 0 }
    gender { 0 }
    stuttering { 0 }
  end
end
