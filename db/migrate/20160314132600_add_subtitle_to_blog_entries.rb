class AddSubtitleToBlogEntries < ActiveRecord::Migration
  def change
    add_column :spree_blog_entries, :subtitle, :string
  end
end
