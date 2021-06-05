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
class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts
  has_many :comments, inverse_of: :post, dependent: :destroy

  validates :content, presence: true
  before_save :set_lonlat

  default_scope { order(created_at: :desc) }
  scope :near, lambda { |lat, lon, distance = 50_000|
    where(Post.arel_table[:lonlat].st_distance("SRID=4326;POINT(#{lon} #{lat})").lt(distance))
  }

  attr_writer :latitude, :longitude

  delegate :id, :username, :avatar_url, to: :user, allow_nil: true, prefix: true
  mount_uploader :image, ImageUploader

  def image_data=(base64_data)
    return unless base64_data

    self.image = Base64File.new(base64_data)
  end

  def latitude
    lonlat&.y
  end

  def longitude
    lonlat&.x
  end

  private

  def set_lonlat
    return if @latitude.nil? || @longitude.nil?

    self.lonlat = "POINT(#{@longitude} #{@latitude})"
  end
end
