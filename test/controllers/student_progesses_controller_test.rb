require "test_helper"

class StudentProgessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_progress = student_progesses(:one)
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
      post student_progesses_url, params: { student_progress: { semester_id: @student_progress.semester_id, student_id: @student_progress.student_id, subject_id: @student_progress.subject_id, year_id: @student_progress.year_id } }
    end

    assert_redirected_to student_progess_url(StudentProgress.last)
  end

  test "should show student_progess" do
    get student_progess_url(@student_progress)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_progess_url(@student_progress)
    assert_response :success
  end

  test "should update student_progess" do
    patch student_progess_url(@student_progress), params: { student_progress: { semester_id: @student_progress.semester_id, student_id: @student_progress.student_id, subject_id: @student_progress.subject_id, year_id: @student_progress.year_id } }
    assert_redirected_to student_progess_url(@student_progress)
  end

  test "should destroy student_progess" do
    assert_difference('StudentProgess.count', -1) do
      delete student_progess_url(@student_progress)
    end

    assert_redirected_to student_progesses_url
  end
end
