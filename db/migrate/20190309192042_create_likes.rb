# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes, id: :uuid do |t|
      t.references :post, foreign_key: true, type: :uuid
      t.references :account, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
