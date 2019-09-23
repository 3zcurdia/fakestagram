# frozen_string_literal: true

module Api::V2
  class PostsController < BaseController
    before_action :set_post, only: %i[show update destroy]

    # GET /posts
    def index
      posts = Post.page(params[:page])
      @posts = posts.includes(:account, image_attachment: :blob)
      # @liked_posts = posts.where(account_id: account_id).pluck(:id)
      authorize @posts
      render json: PostSerializer.new(@posts).serialized_json
    end

    # GET /posts/1
    def show
      authorize @post
      render json: PostSerializer.new(@post).serialized_json
    end

    # POST /posts
    def create
      @post = Post.new(post_params.merge(account: current_user))
      authorize @post
      if @post.save
        render json: PostSerializer.new(@post).serialized_json, status: :created
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /posts/1
    def update
      authorize @post
      if @post.update(post_params)
        render json: PostSerializer.new(@post).serialized_json
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
      params.permit(:image, :image_data, :title, :description, :latitude, :longitude)
    end
  end
end
