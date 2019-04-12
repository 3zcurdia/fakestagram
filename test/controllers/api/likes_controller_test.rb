# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @like = likes(:one)
  end

  test 'should get index' do
    get api_post_likes_url(@post), headers: default_headers, as: :json
    assert_response :success
  end

  test 'should create like' do
    assert_difference('Like.count') do
      post api_post_like_url(posts(:three)), headers: default_headers, as: :json
    end

    assert_response 201
  end

  test 'should destroy like' do
    assert_difference('Like.count', -1) do
      delete api_post_like_url(@post), headers: default_headers, as: :json
    end

    assert_response 204
  end
end
