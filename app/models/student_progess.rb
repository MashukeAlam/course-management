class StudentProgess < ApplicationRecord
  belongs_to :year
  belongs_to :semester
  belongs_to :student
  belongs_to :subject
end
