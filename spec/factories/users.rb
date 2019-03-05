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
