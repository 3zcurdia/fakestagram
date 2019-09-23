# frozen_string_literal: true

module Api::V1
  class CommentsController < BaseController
    before_action :set_post
    before_action :set_comment, only: %i[show update destroy]

    # GET /comments
    def index
      @comments = @post.comments.includes(:account)
      authorize(@comments)
    end

    # GET /comments/1
    def show
      authorize(@comment)
    end

    # POST /comments
    def create
      @comment = @post.comments.build(comment_params.merge(account: current_user))
      authorize(@comment)

      if @comment.save
        render :show, status: :created
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /comments/1
    def update
      authorize(@comment)
      if @comment.update(comment_params)
        render :show
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end

    # DELETE /comments/1
    def destroy
      authorize(@comment)
      @comment.destroy
    end

    private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.permit(:content)
    end
  end
end
