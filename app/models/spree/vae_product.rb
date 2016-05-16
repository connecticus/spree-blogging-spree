class Spree::VaeProduct < ActiveRecord::Base
  belongs_to :blog_entry_section
  acts_as_list scope: :blog_entry_section
end
