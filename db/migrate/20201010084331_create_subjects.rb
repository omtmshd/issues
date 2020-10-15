class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|

      t.references :teacher, null: false, foreign_key: true

      t.string :title
      t.string :weekday
      t.integer :period

      t.timestamps
    end
  end
end
