class Spree::BlogEntrySection < ActiveRecord::Base
  enum layout: [ :text, :text_and_image, :image_and_text, :pull_quote, :image_gallery, :image_slideshow, :product_collection ]

  belongs_to :blog_entry
  acts_as_list scope: :blog_entry

  has_many :blog_entry_section_images, -> { order(position: :asc) }, :as => :viewable, :dependent => :destroy, :class_name => 'Spree::BlogEntryImage'
  accepts_nested_attributes_for :blog_entry_section_images, :reject_if => :all_blank, :allow_destroy => true

  has_many :vae_products, -> { order(position: :asc) }, :dependent => :destroy
  accepts_nested_attributes_for :vae_products, :reject_if => :all_blank, :allow_destroy => true

  def self.icon_set(layout)
    case layout
    when 'text'
      ['align-justify']
    when 'text_and_image'
      ['align-justify', 'products']
    when 'image_and_text'
      ['products', 'align-justify']
    when 'pull_quote'
      ['star']
    when 'image_gallery'
      ['products']
    when 'image_slideshow'
      ['products']
    when 'product_collection'
      ['products']
    end
  end

end
