# frozen_string_literal: true

module Api::V1
  class FakesController < BaseController
    def show
      render json: data
    end

    private

    def data
      {
        username: Faker::Internet.username(specifier: 8)
      }
    end
  end
end
