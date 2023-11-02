require "application_system_test_case"

class TeacherSubjectsTest < ApplicationSystemTestCase
  setup do
    @teacher_subject = teacher_subjects(:one)
  end

  test "visiting the index" do
    visit teacher_subjects_url
    assert_selector "h1", text: "Teacher Subjects"
  end

  test "creating a Teacher subject" do
    visit teacher_subjects_url
    click_on "New Teacher Subject"

    fill_in "Subject", with: @teacher_subject.subject_id
    fill_in "User", with: @teacher_subject.user_id
    click_on "Create Teacher subject"

    assert_text "Teacher subject was successfully created"
    click_on "Back"
  end

  test "updating a Teacher subject" do
    visit teacher_subjects_url
    click_on "Edit", match: :first

    fill_in "Subject", with: @teacher_subject.subject_id
    fill_in "User", with: @teacher_subject.user_id
    click_on "Update Teacher subject"

    assert_text "Teacher subject was successfully updated"
    click_on "Back"
  end

  test "destroying a Teacher subject" do
    visit teacher_subjects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teacher subject was successfully destroyed"
  end
end
