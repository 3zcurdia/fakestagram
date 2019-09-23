# frozen_string_literal: true

require 'test_helper'

class Api::V1::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @comment = comments(:one)
  end

  def default_params
    { content: 'A new comment' }
  end

  test 'should get index' do
    get api_v1_post_comments_url(@post), headers: default_headers, as: :json
    assert_response :success
  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      post api_v1_post_comments_url(@post), params: default_params, headers: default_headers, as: :json
    end

    assert_response 201
  end

  test 'should show comment' do
    get api_v1_post_comment_url(@post, @comment), headers: default_headers, as: :json
    assert_response :success
  end

  test 'should update comment' do
    patch api_v1_post_comment_url(@post, @comment), params: default_params, headers: default_headers, as: :json
    assert_response 200
  end

  test 'should destroy comment' do
    assert_difference('Comment.count', -1) do
      delete api_v1_post_comment_url(@post, @comment), headers: default_headers, as: :json
    end

    assert_response 204
  end
end
