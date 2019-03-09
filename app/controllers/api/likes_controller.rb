# frozen_string_literal: true

module Api
  class LikesController < ApplicationController
    before_action :set_like, only: %i[show update destroy]

    # GET /likes
    def index
      @likes = Like.all

      render json: @likes
    end

    # POST /likes
    def create
      @like = Like.new(like_params)

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

    def like_params
      params.require(:like).permit(:post_id, :account_id)
    end
  end
end
