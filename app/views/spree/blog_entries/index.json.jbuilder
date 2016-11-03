json.set! :blog_entries do
  json.array!(@blog_entries) do |blog_entry|
    json.title blog_entry.title
    json.cover_image_url blog_entry.blog_entry_image ? asset_url(blog_entry.blog_entry_image.attachment.url(:cover)) : nil
    json.grid_image_url blog_entry.blog_entry_image ? asset_url(blog_entry.blog_entry_image.attachment.url(:grid)) : nil
    json.cover_video_embed_code blog_entry.featured_video
    json.alt_text blog_entry.blog_entry_image ? blog_entry.blog_entry_image.alt : nil
    json.subtitle blog_entry.subtitle
    json.byline markdown(blog_entry.byline)
    json.permalink blog_entry.permalink
    json.visible blog_entry.visible
    json.visible_stg blog_entry.visible_stg
    json.published_at blog_entry.published_at
    json.summary markdown(blog_entry.summary)
    json.categories blog_entry.categories
    json.seo_title blog_entry.get_seo_title
    json.seo_description blog_entry.get_seo_description

    json.sections do
      json.array!(blog_entry.blog_entry_sections) do |section|
        json.layout section.layout
        json.body markdown(section.body)
        json.body_column_count section.text_column_count
        json.blog_entry_section_images do
          json.array!(section.blog_entry_section_images) do |image|
            json.position image.position
            json.image_url asset_url(image.attachment.url(:section))
            json.alt_text image.alt
          end
        end
        json.vae_products section.vae_products.map(&:vae_product_id)
      end
    end
  end
end

json.set! :meta do
  json.code response.status
  json.has_more_pages @has_more_pages
end
