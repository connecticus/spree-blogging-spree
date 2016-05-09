class Spree::BlogEntryImage < Spree::Image
  has_attached_file :attachment,
    styles: {
      thumb: '100x100>',
      medium: '410x272#',
      large: '1270x848#'
    }

end
