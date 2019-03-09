module Api
  module Profile
    class PostsController < BaseController
      def index
        render json: @account.posts
      end
    end
  end
end
