# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    before_action :set_account

    protected

    def account_id
      @account_id ||= request.headers["Authorization"]&.split()&.last
    end

    def set_account
      @account = Account.find(account_id)
    rescue ActiveRecord::RecordNotFound
      head(:unauthorized)
    end
  end
end
