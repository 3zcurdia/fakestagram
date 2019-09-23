# frozen_string_literal: true

require 'test_helper'

class Api::V1::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @like = likes(:one)
  end

  test 'should get index' do
    get api_v1_post_likes_url(@post), headers: default_headers, as: :json
    assert_response :success
  end

  test 'should create like' do
    assert_difference('Like.count') do
      post api_v1_post_like_url(posts(:three)), headers: default_headers, as: :json
    end

    assert_response 201
  end

  test 'should destroy like' do
    assert_difference('Like.count', -1) do
      delete api_v1_post_like_url(@post), headers: default_headers, as: :json
    end

    assert_response 204
  end
end
