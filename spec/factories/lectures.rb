FactoryBot.define do
  factory :lecture, class: Lecture do
    date1 = Date.new(2020, 1, 1)
    date2 = date1.next
    date3 = date2.next
    title           { "test_lecture" }
    sequence(:date) { [ date2, date1, date3].sample }
  end
end
