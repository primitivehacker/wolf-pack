require 'test_helper'

class StudySessionsControllerTest < ActionController::TestCase
  setup do
    @study_session = study_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_session" do
    assert_difference('StudySession.count') do
      post :create, study_session: { date: @study_session.date, room_number: @study_session.room_number, tenant_id: @study_session.tenant_id, time: @study_session.time, title: @study_session.title }
    end

    assert_redirected_to study_session_path(assigns(:study_session))
  end

  test "should show study_session" do
    get :show, id: @study_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_session
    assert_response :success
  end

  test "should update study_session" do
    patch :update, id: @study_session, study_session: { date: @study_session.date, room_number: @study_session.room_number, tenant_id: @study_session.tenant_id, time: @study_session.time, title: @study_session.title }
    assert_redirected_to study_session_path(assigns(:study_session))
  end

  test "should destroy study_session" do
    assert_difference('StudySession.count', -1) do
      delete :destroy, id: @study_session
    end

    assert_redirected_to study_sessions_path
  end
end
