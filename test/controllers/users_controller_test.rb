require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    #Need default user
    @user = User.new(name: "Test User", email: "test.user@gmail.com", password: "foobar", password_confirmation: "foobar")
    @user.save
  end

  test "should get show" do
    post :show, id: 1
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

end
