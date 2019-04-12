# frozen_string_literal: true

module Api
  class ProfilesController < BaseController
    def show
      authorize(@account, :show?)
      render json: @account
    end
  end
end
