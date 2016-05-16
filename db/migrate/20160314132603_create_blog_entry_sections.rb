class CreateBlogEntrySections < ActiveRecord::Migration
  def self.up
    create_table :spree_blog_entry_sections do |t|
      t.column :blog_entry_id, :integer
      t.column :layout, :integer, default: 0

      t.column :body, :text

      t.timestamps
    end

    add_index :spree_blog_entry_sections, :blog_entry_id
  end

  def self.down
    drop_table :spree_blog_entry_sections
  end
end
