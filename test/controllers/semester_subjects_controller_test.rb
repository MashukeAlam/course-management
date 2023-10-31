require "test_helper"

class SemesterSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @semester_subject = semester_subjects(:one)
  end

  test "should get index" do
    get semester_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_semester_subject_url
    assert_response :success
  end

  test "should create semester_subject" do
    assert_difference('SemesterSubject.count') do
      post semester_subjects_url, params: { semester_subject: { semester_id: @semester_subject.semester_id, subject_id: @semester_subject.subject_id } }
    end

    assert_redirected_to semester_subject_url(SemesterSubject.last)
  end

  test "should show semester_subject" do
    get semester_subject_url(@semester_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_semester_subject_url(@semester_subject)
    assert_response :success
  end

  test "should update semester_subject" do
    patch semester_subject_url(@semester_subject), params: { semester_subject: { semester_id: @semester_subject.semester_id, subject_id: @semester_subject.subject_id } }
    assert_redirected_to semester_subject_url(@semester_subject)
  end

  test "should destroy semester_subject" do
    assert_difference('SemesterSubject.count', -1) do
      delete semester_subject_url(@semester_subject)
    end

    assert_redirected_to semester_subjects_url
  end
end
