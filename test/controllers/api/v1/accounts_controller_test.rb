# frozen_string_literal: true

require 'test_helper'

class Api::V1::AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test 'should create account' do
    params = { device_model: 'iPhone Xs', device_number: SecureRandom.uuid, name: 'Test User' }
    assert_difference('Account.count') do
      post api_accounts_url, params: params, as: :json
    end

    assert_response 201
    assert_equal 'Test User', json_response[:name]
  end
end
