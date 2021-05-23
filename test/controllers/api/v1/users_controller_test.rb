# frozen_string_literal: true

require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should create user' do
    params = { username: 'micheal.scott', password: 'best.boss.ever' }
    assert_difference('User.count') do
      post api_v1_sign_up_url, params: params, as: :json
    end

    assert_response 201
    assert_not_nil json_response[:token]
  end
end
