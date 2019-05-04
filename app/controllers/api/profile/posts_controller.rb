# frozen_string_literal: true

module Api
  module Profile
    class PostsController < BaseController
      def index
        @posts = current_user.posts.includes(:account, image_attachment: :blob)
        @liked_posts = posts.where(account_id: account_id).pluck(:id)
        authorize(@posts, :index?)
      end
    end
  end
end
