# frozen_string_literal: true

class AddLatLongToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :location, :string, default: ''
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
  end
end
