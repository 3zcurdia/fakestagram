# frozen_string_literal: true

module Api::V2
  class ProfilesController < BaseController
    def show
      authorize(current_user, :show?)
      render json: AccountSerializer.new(current_user).serialized_json
    end
  end
end
