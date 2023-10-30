require "application_system_test_case"

class DeptStudentsTest < ApplicationSystemTestCase
  setup do
    @dept_student = dept_students(:one)
  end

  test "visiting the index" do
    visit dept_students_url
    assert_selector "h1", text: "Dept Students"
  end

  test "creating a Dept student" do
    visit dept_students_url
    click_on "New Dept Student"

    fill_in "Department", with: @dept_student.department_id
    fill_in "User", with: @dept_student.user_id
    click_on "Create Dept student"

    assert_text "Dept student was successfully created"
    click_on "Back"
  end

  test "updating a Dept student" do
    visit dept_students_url
    click_on "Edit", match: :first

    fill_in "Department", with: @dept_student.department_id
    fill_in "User", with: @dept_student.user_id
    click_on "Update Dept student"

    assert_text "Dept student was successfully updated"
    click_on "Back"
  end

  test "destroying a Dept student" do
    visit dept_students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dept student was successfully destroyed"
  end
end
