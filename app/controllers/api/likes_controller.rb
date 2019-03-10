# frozen_string_literal: true

module Api
  class LikesController < BaseController
    before_action :set_post

    # GET /likes
    def index
      @likes = @post.likes.includes(:account)
    end

    # POST /likes
    def create
      @like = @post.likes.find_or_initialize_by(account: @account)
      if @like.persisted? || @like.save
        render json: @like, status: :created
      else
        render json: @like.errors, status: :unprocessable_entity
      end
    end

    # DELETE /likes/1
    def destroy
      @post.likes.where(account: @account).destroy_all
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end
  end
end
