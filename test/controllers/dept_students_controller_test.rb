require "test_helper"

class DeptStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dept_student = dept_students(:one)
  end

  test "should get index" do
    get dept_students_url
    assert_response :success
  end

  test "should get new" do
    get new_dept_student_url
    assert_response :success
  end

  test "should create dept_student" do
    assert_difference('DeptStudent.count') do
      post dept_students_url, params: { dept_student: { department_id: @dept_student.department_id, user_id: @dept_student.user_id } }
    end

    assert_redirected_to dept_student_url(DeptStudent.last)
  end

  test "should show dept_student" do
    get dept_student_url(@dept_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_dept_student_url(@dept_student)
    assert_response :success
  end

  test "should update dept_student" do
    patch dept_student_url(@dept_student), params: { dept_student: { department_id: @dept_student.department_id, user_id: @dept_student.user_id } }
    assert_redirected_to dept_student_url(@dept_student)
  end

  test "should destroy dept_student" do
    assert_difference('DeptStudent.count', -1) do
      delete dept_student_url(@dept_student)
    end

    assert_redirected_to dept_students_url
  end
end
