FactoryBot.define do
  factory :subject do
    association :teacher
    title   { "test_subject" }
    weekday { "test" }
    period  { 1 }
  end

  trait :with_lectures do
    transient do
      lectures_count { 5 }
    end

    after(:create) do |subject, evaluator|
      create_list(:lecture, evaluator.lectures_count, subject: subject)
    end
  end
end
