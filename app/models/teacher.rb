class Teacher < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }

  has_many :subjects, dependent: :destroy
end
