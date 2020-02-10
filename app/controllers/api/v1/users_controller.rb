# frozen_string_literal: true

module Api::V1
  class UsersController < BaseController
    skip_before_action :current_user, only: :create
    # GET /users/1
    def show
      @user = User.find(params[:id])
      authorize(@user)
    end

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        render :show, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.permit(:name, :public_key)
    end
  end
end
