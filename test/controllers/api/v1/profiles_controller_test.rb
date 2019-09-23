# frozen_string_literal: true

require 'test_helper'

class Api::V1::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test 'should show profile' do
    get api_v1_profile_url, headers: default_headers, as: :json
    assert_response :success
    assert_equal accounts(:one).to_json, json_response.to_json
  end
end
