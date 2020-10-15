class Subject < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :weekday, presence: true
  validates :period, presence: true

  belongs_to :teacher
  has_many :lectures, dependent: :destroy

  def self.keyword_search(search)
    return self.all unless search
      self.where(['subjects.title LIKE ?', "%#{search}%"])
  end
  def self.teacher_search(search)
    return self.all unless search
      self.joins(:teacher).where(['teachers.name LIKE ?', "%#{search}%"])
  end
end
