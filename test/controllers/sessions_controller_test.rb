require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "shoud login" do
      post :create, email: @user.email, password: @user.password
      assert_redirected_to users_path
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "shoud login with wrong password" do
    post :create, email: @user.email, password: 'wrong password'
    assert_equal 'Invalid email/password combination', flash[:alert]
  end

  test "shoud login with blank email" do
    post :create, password: @user.email
    assert_equal 'Invalid email/password combination', flash[:alert]
  end

end
