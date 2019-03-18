# frozen_string_literal: true

require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
  end

  test 'should get index' do
    get accounts_url, as: :json
    assert_response :success
  end

  test 'should create account' do
    assert_difference('Account.count') do
      post accounts_url, params: { account: { device_model: @account.device_model, device_number: @account.device_number, name: @account.name } }, as: :json
    end

    assert_response 201
  end

  test 'should show account' do
    get account_url(@account), as: :json
    assert_response :success
  end

  test 'should update account' do
    patch account_url(@account), params: { account: { device_model: @account.device_model, device_number: @account.device_number, name: @account.name } }, as: :json
    assert_response 200
  end

  test 'should destroy account' do
    assert_difference('Account.count', -1) do
      delete account_url(@account), as: :json
    end

    assert_response 204
  end
end
