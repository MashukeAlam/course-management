require "application_system_test_case"

class SemesterSubjectsTest < ApplicationSystemTestCase
  setup do
    @semester_subject = semester_subjects(:one)
  end

  test "visiting the index" do
    visit semester_subjects_url
    assert_selector "h1", text: "Semester Subjects"
  end

  test "creating a Semester subject" do
    visit semester_subjects_url
    click_on "New Semester Subject"

    fill_in "Semester", with: @semester_subject.semester_id
    fill_in "Subject", with: @semester_subject.subject_id
    click_on "Create Semester subject"

    assert_text "Semester subject was successfully created"
    click_on "Back"
  end

  test "updating a Semester subject" do
    visit semester_subjects_url
    click_on "Edit", match: :first

    fill_in "Semester", with: @semester_subject.semester_id
    fill_in "Subject", with: @semester_subject.subject_id
    click_on "Update Semester subject"

    assert_text "Semester subject was successfully updated"
    click_on "Back"
  end

  test "destroying a Semester subject" do
    visit semester_subjects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Semester subject was successfully destroyed"
  end
end
