require "test_helper"

class StudentProgessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_progess = student_progesses(:one)
  end

  test "should get index" do
    get student_progesses_url
    assert_response :success
  end

  test "should get new" do
    get new_student_progess_url
    assert_response :success
  end

  test "should create student_progess" do
    assert_difference('StudentProgess.count') do
      post student_progesses_url, params: { student_progess: { semester_id: @student_progess.semester_id, student_id: @student_progess.student_id, subject_id: @student_progess.subject_id, year_id: @student_progess.year_id } }
    end

    assert_redirected_to student_progess_url(StudentProgess.last)
  end

  test "should show student_progess" do
    get student_progess_url(@student_progess)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_progess_url(@student_progess)
    assert_response :success
  end

  test "should update student_progess" do
    patch student_progess_url(@student_progess), params: { student_progess: { semester_id: @student_progess.semester_id, student_id: @student_progess.student_id, subject_id: @student_progess.subject_id, year_id: @student_progess.year_id } }
    assert_redirected_to student_progess_url(@student_progess)
  end

  test "should destroy student_progess" do
    assert_difference('StudentProgess.count', -1) do
      delete student_progess_url(@student_progess)
    end

    assert_redirected_to student_progesses_url
  end
end
