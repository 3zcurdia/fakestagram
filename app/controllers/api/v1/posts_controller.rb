# frozen_string_literal: true

module Api::V1
  class PostsController < BaseController
    skip_before_action :authenticate!, only: :index
    before_action :set_post, only: %i[show update destroy]
    before_action :set_request_ip, only: %i[create update]

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
      @post = current_user.posts.build(post_params)
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

    def set_request_ip
      params.merge!(ip_source: request.remote_ip)
    end

    def post_params
      params.permit(:image, :image_data, :background_color, :content, :description, :latitude, :longitude, :ip_source)
    end
  end
end
