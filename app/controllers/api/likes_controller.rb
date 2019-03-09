# frozen_string_literal: true

module Api
  class LikesController < BaseController
    before_action :set_post
    before_action :set_like, only: %i[show update destroy]

    # GET /likes
    def index
      @likes = @post.likes
    end

    # POST /likes
    def create
      @like = @post.build_like(account: @account)
      if @like.save
        render json: @like, status: :created, location: @like
      else
        render json: @like.errors, status: :unprocessable_entity
      end
    end

    # DELETE /likes/1
    def destroy
      @like.destroy
    end

    private

    def set_like
      @like = Like.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
  end
end
