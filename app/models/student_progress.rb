class StudentProgress < ApplicationRecord
  belongs_to :year
  belongs_to :semester
  belongs_to :user
end
