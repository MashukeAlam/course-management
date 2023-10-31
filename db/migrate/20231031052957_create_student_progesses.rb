class CreateStudentProgesses < ActiveRecord::Migration[6.1]
  def change
    create_table :student_progesses do |t|
      t.references :year, null: false, foreign_key: true
      t.references :semester, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
