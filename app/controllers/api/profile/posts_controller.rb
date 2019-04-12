# frozen_string_literal: true

module Api
  module Profile
    class PostsController < BaseController
      def index
        @posts = @account.posts.includes(:account, image_attachment: :blob)
        authorize(@posts, :index?)
      end
    end
  end
end
