json.extract! student_progess, :id, :year_id, :semester_id, :student_id, :subject_id, :created_at, :updated_at
json.url student_progess_url(student_progess, format: :json)
