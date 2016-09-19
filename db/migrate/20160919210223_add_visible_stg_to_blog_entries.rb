class AddVisibleStgToBlogEntries < ActiveRecord::Migration
  def change
    add_column :spree_blog_entries, :visible_stg, :boolean, :default => false
  end
end