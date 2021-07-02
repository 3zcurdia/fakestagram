# frozen_string_literal: true

module Api::V1::Posts
  class LikesController < Api::V1::BaseController
    before_action :set_post

    def create
      @like = @post.likes.build(user_id: current_user.id)
      authorize(@like)

      if @like.save
        render :show, status: :created
      else
        render json: @like.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @like = @post.likes.find(user_id: current_user.id)
      authorize(@like)

      if @like.destroy
        render :show, status: :no_content
      else
        render json: @like.errors, status: :unprocessable_entity
      end
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end
  end
end
