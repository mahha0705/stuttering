# frozen_string_literal: true

FactoryBot.define do
  factory :questionTag do
    tag { 0 }

    trait :work do
      tag { 1 }
    end

    trait :job_hunting do
      tag { 2 }
    end
  end
end
