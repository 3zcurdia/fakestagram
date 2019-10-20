# frozen_string_literal: true

module Api::V1
  class ProfilesController < BaseController
    def show
      authorize(current_user, :show?)
    end

    # PATCH/PUT /profile
    def update
      authorize(current_user)

      if current_user.update(profile_params)
        render :show
      else
        render json: current_user.errors, status: :unprocessable_entity
      end
    end

    private

    def profile_params
      params.permit(:avatar, :avatar_data, :name, :device_number, :device_model)
    end
  end
end
