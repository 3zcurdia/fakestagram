# frozen_string_literal: true

module Api::V1
  class BaseController < ApplicationController
    before_action :default_format_json
    before_action :current_user

    protected

    def account_id
      @account_id ||= request.headers['Authorization']&.split()&.last
    end

    def set_account
      Account.find(account_id)
    rescue ActiveRecord::RecordNotFound
      head(:unauthorized)
    end

    def default_format_json
      request.format = 'json'
    end

    def current_user
      @current_user ||= set_account
    end
    helper_method :current_user
  end
end
