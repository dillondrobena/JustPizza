require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    #Need default user
    @user2 = users(:toppy)
    @user = User.new(name: "Test User", email: "test.user@gmail.com", password: "foobar", password_confirmation: "foobar")
    @user.save
  end

  test "should get show" do
    post :show, id: @user.id
    assert_response :success
  end

  test "should get create" do
    post :create, user: { name:  "Example User",
                          email: "user@example.com",
                          password:              "password",
                          password_confirmation: "password" }
    assert_response :redirect
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@user2)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@user2)
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end

end
