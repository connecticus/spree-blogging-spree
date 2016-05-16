class AddPositionToBlogEntrySections < ActiveRecord::Migration
  def change
    add_column :spree_blog_entry_sections, :position, :integer, default: 0
  end
end
