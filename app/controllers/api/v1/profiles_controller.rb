# frozen_string_literal: true

module Api::V1
  class ProfilesController < BaseController
    def show
      authorize(current_user, :show?)
      render json: current_user
    end
  end
end
