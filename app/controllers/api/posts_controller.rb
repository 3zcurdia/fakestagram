# frozen_string_literal: true

module Api
  class PostsController < BaseController
    before_action :set_post, only: %i[show update destroy]

    # GET /posts
    def index
      @posts = Post.all
    end

    # GET /posts/1
    def show; end

    # POST /posts
    def create
      params[:post][:account_id] = account_id if params[:post]
      @post = Post.new(post_params)

      if @post.save
        render :show, status: :created, location: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    # DELETE /posts/1
    def destroy
      @post.destroy
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:image, :title, :description, :likes_count, :comments_count)
    end
  end
end
