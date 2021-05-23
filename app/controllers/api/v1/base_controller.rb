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
      head(:unauthorized) unless current_user
    end

    def current_user
      @current_user ||= User.find_by(id: auth_payload['sub']) if auth_payload
    end
    helper_method :current_user

    private

    def auth_payload
      Token.decode(auth_token)
    rescue JWT::DecodeError
      nil
    end

    def auth_token
      request.headers['Authorization']&.scan(/Bearer(.*)$/)&.flatten&.last&.strip
    end
  end
end
