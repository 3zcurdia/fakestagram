# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def post
    @post ||= posts(:one)
  end

  def test_valid
    assert post.valid?
  end

  def test_author_data
    assert_equal 'Joe Doe', post.author_name
  end

  def test_invalid_nil_title
    post.title = nil
    refute post.valid?
  end
end
