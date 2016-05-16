class AddBylineToBlogEntries < ActiveRecord::Migration
  def change
    add_column :spree_blog_entries, :byline, :text
  end
end
