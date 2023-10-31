# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_10_31_054435) do

  create_table "departments", force: :cascade do |t|
    t.string "title"
    t.text "desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dept_students", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_dept_students_on_department_id"
    t.index ["user_id"], name: "index_dept_students_on_user_id"
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "role"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "approved"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.string "title"
    t.integer "year_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["year_id"], name: "index_semesters_on_year_id"
  end

  create_table "student_progresses", force: :cascade do |t|
    t.integer "year_id", null: false
    t.integer "semester_id", null: false
    t.integer "student_id", null: false
    t.integer "subject_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["semester_id"], name: "index_student_progresses_on_semester_id"
    t.index ["student_id"], name: "index_student_progresses_on_student_id"
    t.index ["subject_id"], name: "index_student_progresses_on_subject_id"
    t.index ["year_id"], name: "index_student_progresses_on_year_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title"
    t.string "sub_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "years", force: :cascade do |t|
    t.integer "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["department_id"], name: "index_years_on_department_id"
  end

  add_foreign_key "dept_students", "departments"
  add_foreign_key "dept_students", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "roles", "users"
  add_foreign_key "semesters", "years"
  add_foreign_key "student_progresses", "semesters"
  add_foreign_key "student_progresses", "students"
  add_foreign_key "student_progresses", "subjects"
  add_foreign_key "student_progresses", "years"
  add_foreign_key "years", "departments"
end
