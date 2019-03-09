# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.references :post, foreign_key: true
      t.references :account, foreign_key: true, type: :uuid
      t.text :content, null: false

      t.timestamps
    end
  end
end
