json.set! :blog_entry do
  json.title @blog_entry.title
  json.main_image @blog_entry.blog_entry_image ? asset_url(@blog_entry.blog_entry_image.attachment.url(:large)) : nil
  json.main_image_alt_text @blog_entry.blog_entry_image ? @blog_entry.blog_entry_image.alt : nil
  json.subtitle @blog_entry.subtitle
  json.byline @blog_entry.byline
  json.permalink @blog_entry.permalink
  json.visible @blog_entry.visible
  json.published_at @blog_entry.published_at
  json.summary @blog_entry.summary
  json.categories @blog_entry.categories
  json.seo_title @blog_entry.get_seo_title
  json.seo_description @blog_entry.get_seo_description

  json.sections do
    json.array!(@blog_entry.blog_entry_sections) do |section|
      json.layout section.layout
      json.body section.body
      json.blog_entry_section_images do
        json.array!(section.blog_entry_section_images) do |image|
          json.position image.position
          json.image_url asset_url(image.attachment.url(:large))
          json.alt_text image.alt
        end
      end
      json.vae_products section.vae_products.map(&:vae_product_id)
    end
  end

  if @previous_blog_entry.present?
    json.previous_blog_entry do
      json.title @previous_blog_entry.title
      json.permalink @previous_blog_entry.permalink
    end
  else
    json.previous_blog_entry nil
  end

  if @next_blog_entry.present?
    json.next_blog_entry do
      json.title @next_blog_entry.title
      json.permalink @next_blog_entry.permalink
    end
  else
    json.next_blog_entry nil
  end

  json.more_blog_entries do
    json.array!(@more_blog_entries) do |blog_entry|
      json.title blog_entry.title
      json.main_image blog_entry.blog_entry_image ? asset_url(blog_entry.blog_entry_image.attachment.url(:large)) : nil
      json.subtitle blog_entry.subtitle
      json.byline blog_entry.byline
      json.permalink blog_entry.permalink
      json.visible blog_entry.visible
      json.published_at blog_entry.published_at
      json.summary blog_entry.summary
      json.categories blog_entry.categories
    end
  end
end

json.set! :meta do
  json.code response.status
end

