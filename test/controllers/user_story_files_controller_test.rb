require 'test_helper'

class UserStoryFilesControllerTest < ActionController::TestCase
  setup do
    @user_story_file = user_story_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_story_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_story_file" do
    assert_difference('UserStoryFile.count') do
      post :create, user_story_file: {  }
    end

    assert_redirected_to user_story_file_path(assigns(:user_story_file))
  end

  test "should show user_story_file" do
    get :show, id: @user_story_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_story_file
    assert_response :success
  end

  test "should update user_story_file" do
    patch :update, id: @user_story_file, user_story_file: {  }
    assert_redirected_to user_story_file_path(assigns(:user_story_file))
  end

  test "should destroy user_story_file" do
    assert_difference('UserStoryFile.count', -1) do
      delete :destroy, id: @user_story_file
    end

    assert_redirected_to user_story_files_path
  end
end
