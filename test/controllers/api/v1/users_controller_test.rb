# frozen_string_literal: true

require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should create user' do
    params = { device_model: 'iPhone Xs', device_number: SecureRandom.uuid, name: 'Test User' }
    assert_difference('User.count') do
      post api_v1_users_url, params: params, as: :json
    end

    assert_response 201
    assert_equal 'Test User', json_response[:name]
  end
end
