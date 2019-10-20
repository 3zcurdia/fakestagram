# frozen_string_literal: true

module Api::V1
  class AccountsController < BaseController
    skip_before_action :current_user, only: :create
    # GET /accounts/1
    def show
      @account = Account.find(params[:id])
      authorize(@account)
    end

    # POST /accounts
    def create
      @account = Account.new(account_params)

      if @account.save
        render :show, status: :created
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /accounts/1
    def update
      @account = Account.find(params[:id])
      authorize(@account)

      if @account.update(account_params)
        render :show
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end

    private

    def account_params
      params.permit(:avatar, :avatar_data, :name, :device_number, :device_model)
    end
  end
end
