# frozen_string_literal: true

class DropActiveStorageTables < ActiveRecord::Migration[6.0]
  def up
    drop_table :active_storage_attachments
    drop_table :active_storage_blobs
  end
end
