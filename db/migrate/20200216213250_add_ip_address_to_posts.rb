# frozen_string_literal: true

class AddIpAddressToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :ip_source, :string
  end
end
