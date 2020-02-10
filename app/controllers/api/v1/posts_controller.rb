# frozen_string_literal: true

module Api::V1
  class PostsController < BaseController
    before_action :set_post, only: %i[show update destroy]

    # GET /posts
    def index
      posts = Post.page(params[:page])
      @posts = posts.includes(:user)
      authorize @posts
    end

    # GET /posts/1
    def show
      authorize @post
    end

    # POST /posts
    def create
      @post = Post.new(post_params.merge(user: current_user))
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
        render :show
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
      params.permit(:image, :image_data, :background_color, :title, :description, :latitude, :longitude)
    end
  end
end
