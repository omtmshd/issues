class Lecture < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :date, presence: true

  belongs_to :subject
end
