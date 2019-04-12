# frozen_string_literal: true

require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test 'should show profile' do
    get api_profile_url, headers: default_headers, as: :json
    assert_response :success
    assert_equal accounts(:one).to_json, json_response.to_json
  end
end
