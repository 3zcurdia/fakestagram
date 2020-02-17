# frozen_string_literal: true

module Api::V1::Posts
  class NearController < Api::V1::BaseController
    def index
      @posts = Post.includes(:user).near(params[:latitude], params[:longitude]).page(params[:page])
      authorize @posts
    end
  end
end
