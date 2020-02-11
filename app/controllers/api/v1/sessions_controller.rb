# frozen_string_literal: true

module Api::V1
  class SessionsController < BaseController
    skip_before_action :authenticate!

    # POST /users
    def create
      user = User.find_by(username: session_params[:username])
      if user.authenticate(session_params[:password])
        render json: { token: user.token }
      else
        render json: @user.errors, status: :unauthorized
      end
    end

    private

    def session_params
      params.permit(:username, :password)
    end
  end
end
