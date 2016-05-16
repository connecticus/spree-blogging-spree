class Spree::BlogEntryImage < Spree::Image
  has_attached_file :attachment,
                    styles: { thumb: '150x100#', medium: '410x272#', large: '1270x848#' },
                    default_style: :medium,
                    convert_options: { all: '-strip -auto-orient -colorspace sRGB' }
  validates_attachment :attachment,
    :presence => true,
    :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }



end
