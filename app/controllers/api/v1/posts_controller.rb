# frozen_string_literal: true

module Api::V1
  class PostsController < BaseController
    before_action :set_post, only: %i[show update destroy]

    # GET /posts
    def index
      @posts = Post.includes(:user).page(params[:page])
      authorize @posts
    end

    # GET /posts/1
    def show
      authorize @post
    end

    # POST /posts
    def create
      params.merge!(user: current_user, ip_source: request.remote_ip)
      @post = Post.new(post_params)
      authorize @post

      if @post.save
        render :show, status: :created
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /posts/1
    def update
      params.merge!(ip_source: request.remote_ip)
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
      params.permit(:image, :image_data, :background_color, :title, :description, :latitude, :longitude, :user, :ip_source)
    end
  end
end
