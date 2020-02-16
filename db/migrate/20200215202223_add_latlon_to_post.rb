# frozen_string_literal: true

class AddLatlonToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :lonlat, :st_point, geographic: true, srid: 4326
  end
end
