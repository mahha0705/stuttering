FactoryBot.define do
  factory :answer do
    title { 'test answer' }
    body { 'test answer body' }
    association :user
    association :question
  end
end
