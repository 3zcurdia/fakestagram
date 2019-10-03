# frozen_string_literal: true

require 'test_helper'

class Api::V1::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test 'must show profile' do
    get api_v1_profile_url, headers: default_headers, as: :json
    assert_response :success
    assert_equal 'Joe Doe', json_response[:name]
  end
end
