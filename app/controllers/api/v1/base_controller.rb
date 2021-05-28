# frozen_string_literal: true

module Api::V1
  class BaseController < ApplicationController
    before_action :default_format_json
    before_action :authenticate!

    protected

    def default_format_json
      request.format = 'json'
    end

    def authenticate!
      auth_payload
    rescue JWT::DecodeError => err
      render(json: { error: err.message }, status: :unauthorized) and return
    end

    def current_user
      @current_user ||= User.find_by(id: auth_payload['sub'])
    end
    helper_method :current_user

    private

    def auth_payload
      Token.decode(auth_token)
    end

    def auth_token
      request.headers['Authorization']&.scan(/Bearer(.*)$/)&.flatten&.last&.strip
    end
  end
end
