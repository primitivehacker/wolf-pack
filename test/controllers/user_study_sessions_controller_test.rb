require 'test_helper'

class UserStudySessionsControllerTest < ActionController::TestCase
  setup do
    @user_study_session = user_study_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_study_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_study_session" do
    assert_difference('UserStudySession.count') do
      post :create, user_study_session: { study_session_id: @user_study_session.study_session_id, user_id: @user_study_session.user_id }
    end

    assert_redirected_to user_study_session_path(assigns(:user_study_session))
  end

  test "should show user_study_session" do
    get :show, id: @user_study_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_study_session
    assert_response :success
  end

  test "should update user_study_session" do
    patch :update, id: @user_study_session, user_study_session: { study_session_id: @user_study_session.study_session_id, user_id: @user_study_session.user_id }
    assert_redirected_to user_study_session_path(assigns(:user_study_session))
  end

  test "should destroy user_study_session" do
    assert_difference('UserStudySession.count', -1) do
      delete :destroy, id: @user_study_session
    end

    assert_redirected_to user_study_sessions_path
  end
end
