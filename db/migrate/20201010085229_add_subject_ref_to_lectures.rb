class AddSubjectRefToLectures < ActiveRecord::Migration[6.0]
  def change
    add_reference :lectures, :subject, null: false, foreign_key: true
  end
end
