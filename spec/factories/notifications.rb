FactoryBot.define do
  factory :notification do
    notified_type { '回答' }
    association :user
    association :notified_by
    association :question
  end
end
