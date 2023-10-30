class CreateSemesters < ActiveRecord::Migration[6.1]
  def change
    create_table :semesters do |t|
      t.string :title
      t.references :year, null: false, foreign_key: true

      t.timestamps
    end
  end
end
