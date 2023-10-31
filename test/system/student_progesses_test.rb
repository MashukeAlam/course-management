require "application_system_test_case"

class StudentProgessesTest < ApplicationSystemTestCase
  setup do
    @student_progress = student_progesses(:one)
  end

  test "visiting the index" do
    visit student_progesses_url
    assert_selector "h1", text: "Student Progesses"
  end

  test "creating a Student progess" do
    visit student_progesses_url
    click_on "New Student Progess"

    fill_in "Semester", with: @student_progress.semester_id
    fill_in "Student", with: @student_progress.student_id
    fill_in "Subject", with: @student_progress.subject_id
    fill_in "Year", with: @student_progress.year_id
    click_on "Create Student progess"

    assert_text "Student progess was successfully created"
    click_on "Back"
  end

  test "updating a Student progess" do
    visit student_progesses_url
    click_on "Edit", match: :first

    fill_in "Semester", with: @student_progress.semester_id
    fill_in "Student", with: @student_progress.student_id
    fill_in "Subject", with: @student_progress.subject_id
    fill_in "Year", with: @student_progress.year_id
    click_on "Update Student progess"

    assert_text "Student progess was successfully updated"
    click_on "Back"
  end

  test "destroying a Student progess" do
    visit student_progesses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student progess was successfully destroyed"
  end
end
