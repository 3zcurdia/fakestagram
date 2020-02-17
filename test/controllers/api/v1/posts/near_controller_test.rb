# frozen_string_literal: true

require 'test_helper'

class Api::V1::Posts::NearControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_v1_posts_near_url(latitude: 19.40181717, longitude: -99.14291370), headers: default_headers, as: :json
    assert_response :success
  end
end
