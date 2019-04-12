# frozen_string_literal: true

require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test 'should create account' do
    assert_difference('Account.count') do
      post api_accounts_url, params: { device_model: 'iPhone Xs', device_number: SecureRandom.uuid, name: 'Test User' }, as: :json
    end

    assert_response 201
    assert_equal 'Test User', json_response[:name]
  end
end
