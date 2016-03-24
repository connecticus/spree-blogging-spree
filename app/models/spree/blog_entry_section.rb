class Spree::BlogEntrySection < ActiveRecord::Base
  enum layout: [ :text, :text_and_image, :image_and_text, :pull_quote, :image_gallery, :product_collection ]

  belongs_to :blog_entry

  has_many :blog_entry_images, :as => :viewable, :dependent => :destroy, :class_name => 'Spree::BlogEntryImage'
  accepts_nested_attributes_for :blog_entry_images, :reject_if => :all_blank

end
