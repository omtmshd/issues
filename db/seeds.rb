# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env == 'development'
  2.times do |n|
    teacher = Teacher.create!(
      name: "teacher-#{n + 1}"
    )
    subject = teacher.subjects.create(
      title: "科目-#{n + 1}",
      weekday: "monday",
      period: n
    )
    date1 = Date.new(2020, 10, n + 1)
    date2 = Date.new(2020, 10, (n + 1) * 2)
    date3 = Date.new(2020, (n + 1), 1)
    subject.lectures.create(
      title: "講義#{n + 1}",
      date: date1
    )
    subject.lectures.create(
      title: "講義#{(n + 1) * 2 }",
      date: date2
    )
    subject.lectures.create(
      title: "講義#{(n + 1) * 3 }",
      date: date3
    )
  end
end
