# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def post
    @post ||= posts(:one)
  end

  def test_valid
    assert post.valid?
    refute post.image.attached?
  end

  def test_author_data
    assert_equal 'Joe Doe', post.author_name
  end

  def test_invalid_nil_title
    post.title = nil
    refute post.valid?
  end

  def test_image_data_store
    image_data = File.read(Rails.root.join('test', 'fixtures', 'files', 'base64_image.txt'))
    post.update(image_data: image_data)
    assert post.image.attached?
  end
end
