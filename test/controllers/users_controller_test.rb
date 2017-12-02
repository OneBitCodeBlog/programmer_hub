require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get followers" do
    get users_followers_url
    assert_response :success
  end

  test "should get followings" do
    get users_followings_url
    assert_response :success
  end

  test "should get search" do
    get users_search_url
    assert_response :success
  end

end
