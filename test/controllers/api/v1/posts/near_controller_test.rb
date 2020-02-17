require 'test_helper'

class Api::V1::Posts::NearControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_posts_near_url
    assert_response :success
  end
end
