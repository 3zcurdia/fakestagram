# frozen_string_literal: true

require 'test_helper'

class Api::V1::FakesControllerTest < ActionDispatch::IntegrationTest
  test 'must return a valid value' do
    get api_v1_fake_url
    assert_response 200
    refute_nil json_response[:username]
  end
end
