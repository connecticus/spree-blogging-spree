class AddTextColumnCountToBlogEntrySections < ActiveRecord::Migration
  def change
    add_column :spree_blog_entry_sections, :text_column_count, :integer, default: 1
  end
end
