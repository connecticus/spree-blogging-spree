class FixVideoHeroName < ActiveRecord::Migration
  def change
	rename_column :spree_blog_entries, :video_hero, :featured_video
  end
end
