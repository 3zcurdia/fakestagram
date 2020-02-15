# frozen_string_literal: true

module Api::V1
  class BaseController < ApplicationController
    before_action :default_format_json
    before_action :authenticate!

    protected

    def authenticate!
      head(:unauthorized) unless current_user
    end

    def default_format_json
      request.format = 'json'
    end

    def current_user
      return unless auth_token
      @current_user ||= User.find(auth_payload['sub'])
    rescue ActiveRecord::RecordNotFound
      head(:unauthorized)
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
