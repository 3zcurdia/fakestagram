# frozen_string_literal: true

module Api::V1
  module Profile
    class PostsController < BaseController
      def index
        @posts = current_user.posts.includes(:user)
        authorize(@posts, :index?)
      end
    end
  end
end
