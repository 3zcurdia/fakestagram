# frozen_string_literal: true

class FixTypoInAccounts < ActiveRecord::Migration[6.0]
  def change
    rename_column :accounts, :devise_model, :device_model
    rename_column :accounts, :devise_number, :device_number
  end
end
