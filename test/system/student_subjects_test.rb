require "application_system_test_case"

class StudentSubjectsTest < ApplicationSystemTestCase
  setup do
    @student_subject = student_subjects(:one)
  end

  test "visiting the index" do
    visit student_subjects_url
    assert_selector "h1", text: "Student Subjects"
  end

  test "creating a Student subject" do
    visit student_subjects_url
    click_on "New Student Subject"

    fill_in "Subject", with: @student_subject.subject_id
    fill_in "User", with: @student_subject.user_id
    click_on "Create Student subject"

    assert_text "Student subject was successfully created"
    click_on "Back"
  end

  test "updating a Student subject" do
    visit student_subjects_url
    click_on "Edit", match: :first

    fill_in "Subject", with: @student_subject.subject_id
    fill_in "User", with: @student_subject.user_id
    click_on "Update Student subject"

    assert_text "Student subject was successfully updated"
    click_on "Back"
  end

  test "destroying a Student subject" do
    visit student_subjects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student subject was successfully destroyed"
  end
end
