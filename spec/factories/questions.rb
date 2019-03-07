FactoryBot.define do
  factory :question do
    title { 'test question' }
    body { 'test question body' }
    questionTags { [build(:questionTag)] }
    answers { [] }
    association :user

    trait :school do
      title { 'test question and tag is school' }
      body { 'test question body and tag is school' }
      questionTags { [build(:questionTag)] }
    end

    trait :work do
      title { 'test question and tag is work' }
      body { 'test question body and tag is work' }
      questionTags { [build(:questionTag, :work)] }
    end

    trait :job_hunting do
      title { 'test question and tag is job_hunting' }
      body { 'test question body and tag is job_hunting' }
      questionTags { [build(:questionTag, :job_hunting)] }
    end

    trait :has_answer do
      answers { [build(:answer)] }
    end
  end
end
