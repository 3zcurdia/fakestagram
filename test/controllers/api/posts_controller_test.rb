# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  def default_params
    { title: 'A post title' }
  end

  test 'should get index' do
    get api_posts_url, headers: default_headers, as: :json
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post api_posts_url, params: default_params, headers: default_headers, as: :json
    end

    assert_response 201
  end

  test 'should show post' do
    get api_post_url(@post), headers: default_headers, as: :json
    assert_response :success
  end

  test 'should update post' do
    patch api_post_url(@post), params: default_params, headers: default_headers, as: :json
    assert_response 200
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete api_post_url(@post), headers: default_headers, as: :json
    end

    assert_response 204
  end
end
