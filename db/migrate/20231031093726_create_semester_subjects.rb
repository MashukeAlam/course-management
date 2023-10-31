class CreateSemesterSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :semester_subjects do |t|
      t.references :semester, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
