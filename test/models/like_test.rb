# frozen_string_literal: true

require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def like
    @like ||= likes(:one)
  end

  def test_valid
    assert like.valid?
  end

  def test_author_data
    assert_equal 'Joe Doe', like.author_name
  end
end
