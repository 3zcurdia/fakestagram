# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id               :bigint           not null, primary key
#  background_color :string           default("#333333")
#  comments_count   :integer          default(0)
#  content          :text             not null
#  image            :string
#  ip_source        :string
#  likes_count      :integer          default(0)
#  lonlat           :geography        point, 4326
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def post
    @post ||= posts(:one)
  end

  def test_valid
    assert post.valid?
    assert_not post.image?
  end

  def test_author_data
    assert_equal 'Joe.Doe', post.user_username
  end

  def test_invalid_nil_title
    post.content = nil
    assert_not post.valid?
  end

  def test_image_data_store
    image_data = File.read(Rails.root.join('test/fixtures/files/base64_image.txt'))
    post.update(image_data: image_data)
    assert post.image?
  end

  def test_save_latitude
    post.latitude = 19.12345678901234
    post.longitude = -99.12345678901234
    post.save! && post.reload
    assert_not_nil post.lonlat
    assert_equal(19.12345678901234, post.latitude)
  end

  def test_save_longitude
    post.latitude = 19.12345678901234
    post.longitude = -99.12345678901234
    post.save! && post.reload
    assert_not_nil post.lonlat
    assert_equal(-99.12345678901234, post.longitude)
  end

  def test_ip_source
    post.ip_source = '192.168.100.1'
    assert_equal '192.168.100.1', post.ip_source
  end
end
