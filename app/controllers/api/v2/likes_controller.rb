# frozen_string_literal: true

module Api::V2
  class LikesController < BaseController
    before_action :set_post

    # GET /likes
    def index
      @likes = @post.likes.includes(:account)
      authorize(@likes)
      render json: LikeSerializer.new(@likes).serialized_json
    end

    def show; end

    # POST /likes
    def create
      @like = @post.likes.find_or_initialize_by(account: current_user)
      authorize(@like)
      if @like.persisted? || @like.save
        render json: LikeSerializer.new(@likes).serialized_json, status: :created
      else
        render json: @like.errors, status: :unprocessable_entity
      end
    end

    # DELETE /likes/1
    def destroy
      @likes = @post.likes.where(account: current_user)
      authorize(@likes)
      @likes.destroy_all
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end
  end
end
