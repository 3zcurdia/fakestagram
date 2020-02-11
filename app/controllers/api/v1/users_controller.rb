# frozen_string_literal: true

module Api::V1
  class UsersController < BaseController
    skip_before_action :authenticate!

    # POST /users
    def create
      user = User.new(user_params)
      if user.save
        render json: { token: user.token }, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.permit(:username, :password, :password_confirmation)
    end
  end
end
