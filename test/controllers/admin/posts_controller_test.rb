require 'test_helper'


class Admin::PostsControllerTest < ActionController::TestCase

  include SessionsHelper

  # testing for an admin user
  test "allow admin user" do
    user = player(:admin_user)
    @request.session[:player_id] = user.id #spoofing the session to check the user

    get :index
    assert_response :success
  end
  test "allow  user" do
    user = player(:regular_player)
    @request.session[:player_id] = user.id

    get :index
    assert_response :success
  end

end
