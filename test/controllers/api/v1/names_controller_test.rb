# frozen_string_literal: true

require 'test_helper'

class Api::V1::FakesControllerTest < ActionDispatch::IntegrationTest
  test 'must return a valid value' do
    assert_response 200
    refute_equal json_response[:username]
  end
end
