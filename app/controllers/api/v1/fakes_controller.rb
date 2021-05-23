# frozen_string_literal: true

module Api::V1
  class FakesController < BaseController
    skip_before_action :authenticate!
    def show
      render json: data
    end

    private

    def data
      {
        name: Faker::Name.name,
        username: Faker::Internet.username(specifier: 8),
        email: Faker::Internet.email
      }
    end
  end
end
