class AddVideoEmbedToBlogEntries < ActiveRecord::Migration
  def change
    add_column :spree_blog_entries, :video_embed, :text
  end
end
