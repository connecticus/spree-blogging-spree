class CreateVaeProducts < ActiveRecord::Migration
  def self.up
    create_table :spree_vae_products do |t|
      t.column :blog_entry_section_id, :integer
      t.column :vae_product_id, :integer
      t.column :position, :integer, default: 0
      t.column :name, :string
      t.column :img_src, :string

      t.timestamps
    end

    add_index :spree_vae_products, :blog_entry_section_id
  end

  def self.down
    drop_table :spree_vae_products
  end
end
