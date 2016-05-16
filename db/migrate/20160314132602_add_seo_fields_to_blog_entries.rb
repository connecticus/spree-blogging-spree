class AddSeoFieldsToBlogEntries < ActiveRecord::Migration
  def change
    add_column :spree_blog_entries, :seo_title, :string
    add_column :spree_blog_entries, :seo_description, :string
  end
end
