# frozen_string_literal: true

class AddPasswordToUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :name
    add_column :users, :username, :string, null: false
    add_column :users, :password_digest, :string, null: false
  end
end
