# frozen_string_literal: true

module Api
  class AccountsController < ApplicationController
    # GET /accounts/1
    def show
      @account = Account.find(params[:id])
      render json: @account
    end

    # POST /accounts
    def create
      @account = Account.new(account_params)

      if @account.save
        render json: @account, status: :created, location: @account
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end

    private

    # Only allow a trusted parameter "white list" through.
    def account_params
      params.require(:account).permit(:name, :devise_number, :devise_model)
    end
  end
end
