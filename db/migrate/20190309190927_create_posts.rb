# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.text :title, null: false
      t.string :image
      t.string :background_color, default: '#333333'
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
