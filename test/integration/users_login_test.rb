require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:toppy)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: {email: "", password: ""}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    post login_path session: {email: @user.email, password: 'password'}
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end

  test "logout is valid" do
    get login_path
    post login_path session: {email: @user.email, password: 'password'}
    assert is_logged_in?
    follow_redirect!
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_path
  end

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_nil cookies['remember_token']
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end

end
