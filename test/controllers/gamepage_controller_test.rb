require 'test_helper'

class GamepageControllerTest < ActionDispatch::IntegrationTest
  test "should get map" do
    get gamepage_map_url
    assert_response :success
  end

end
