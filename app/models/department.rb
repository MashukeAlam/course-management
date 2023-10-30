class Department < ApplicationRecord
  has_many :years

  DEPTS = []
  Department.all.each do |dept|
    DEPTS.append([dept.title, dept.id])
  end
end
