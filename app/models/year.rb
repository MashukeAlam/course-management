class Year < ApplicationRecord
  belongs_to :department
  has_many :semesters
end
