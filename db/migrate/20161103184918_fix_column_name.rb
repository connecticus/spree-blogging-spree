class FixColumnName < ActiveRecord::Migration
  def change
	rename_column :spree_blog_entries, :video_embed, :video_hero
  end
end
