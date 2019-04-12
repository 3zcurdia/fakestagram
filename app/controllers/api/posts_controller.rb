# frozen_string_literal: true

module Api
  class PostsController < BaseController
    before_action :set_post, only: %i[show update destroy]

    # GET /posts
    def index
      @posts = Post.includes(:account, image_attachment: :blob).page(params[:page])
      authorize @posts
    end

    # GET /posts/1
    def show
      authorize @post
    end

    # POST /posts
    def create
      @post = Post.new(post_params.merge(account: @account))
      authorize @post

      if @post.save
        render :show, status: :created
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /posts/1
    def update
      authorize @post
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # DELETE /posts/1
    def destroy
      authorize @post
      @post.destroy
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.permit(:image, :image_data, :title, :description, :likes_count, :comments_count)
    end
  end
end
