# frozen_string_literal: true

module Api::V2
  class AccountsController < BaseController
    skip_before_action :current_user
    # GET /accounts/1
    def show
      @account = Account.find(params[:id])
      render json: AccountSerializer.new(@account).serialized_json
    end

    # POST /accounts
    def create
      @account = Account.new(account_params)

      if @account.save
        render json: AccountSerializer.new(@account).serialized_json, status: :created
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end

    private

    def account_params
      params.permit(:name, :device_number, :device_model)
    end
  end
end
