class RenameTitleToContentForPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :title, :content
  end
end
