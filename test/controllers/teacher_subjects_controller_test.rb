require "test_helper"

class TeacherSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_subject = teacher_subjects(:one)
  end

  test "should get index" do
    get teacher_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_subject_url
    assert_response :success
  end

  test "should create teacher_subject" do
    assert_difference('TeacherSubject.count') do
      post teacher_subjects_url, params: { teacher_subject: { subject_id: @teacher_subject.subject_id, user_id: @teacher_subject.user_id } }
    end

    assert_redirected_to teacher_subject_url(TeacherSubject.last)
  end

  test "should show teacher_subject" do
    get teacher_subject_url(@teacher_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_subject_url(@teacher_subject)
    assert_response :success
  end

  test "should update teacher_subject" do
    patch teacher_subject_url(@teacher_subject), params: { teacher_subject: { subject_id: @teacher_subject.subject_id, user_id: @teacher_subject.user_id } }
    assert_redirected_to teacher_subject_url(@teacher_subject)
  end

  test "should destroy teacher_subject" do
    assert_difference('TeacherSubject.count', -1) do
      delete teacher_subject_url(@teacher_subject)
    end

    assert_redirected_to teacher_subjects_url
  end
end
