# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def comment
    @comment ||= comments(:one)
  end

  def test_valid
    assert comment.valid?
  end

  def test_author_data
    assert_equal 'Joe Doe', comment.user_name
  end
end
