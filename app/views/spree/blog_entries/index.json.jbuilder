json.array!(@blog_entries) do |blog_entry|
  json.title blog_entry.title
  json.main_image blog_entry.blog_entry_image ? asset_url(blog_entry.blog_entry_image.attachment.url(:large)) : nil
  json.subtitle blog_entry.subtitle
  json.byline blog_entry.byline
  json.permalink blog_entry.permalink
  json.visible blog_entry.visible
  json.published_at blog_entry.published_at
  json.summary blog_entry.summary
  json.categories blog_entry.category_list
  json.seo_title blog_entry.get_seo_title
  json.seo_description blog_entry.get_seo_description

  json.sections do
    json.array!(blog_entry.blog_entry_sections) do |section|
      json.layout section.layout
      json.body section.body
      json.blog_entry_section_images do
        json.array!(section.blog_entry_section_images) do |image|
          json.position image.position
          json.image_url asset_url(image.attachment.url(:large))
        end
      end
      json.vae_products section.vae_products.map(&:id)
    end
  end
end



