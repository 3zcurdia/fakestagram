# frozen_string_literal: true

module Api
  class ProfilesController < BaseController
    def show
      render json: @account
    end
  end
end
