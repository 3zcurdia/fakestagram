# frozen_string_literal: true

module Api::V1
  class NamesController < BaseController
    def show
      render json: { name: Faker::Name.name }
    end
  end
end
