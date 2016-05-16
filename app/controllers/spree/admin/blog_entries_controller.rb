require 'open-uri'

class Spree::Admin::BlogEntriesController < Spree::Admin::ResourceController
  helper 'spree/blog_entries'

  def product_search
    @results = Hash.from_xml(open("http://saturdaysnyc.vaesite.com/feed/search.xml?paginate=10&s=#{params[:s]}"))
    render json: @results["rss"]["channel"]["a"]
  end

  private

    def location_after_save
      edit_admin_blog_entry_url(@blog_entry)
    end

    def collection
      page = params[:page].to_i > 0 ? params[:page].to_i : 1
      per_page = params[:per_page].to_i > 0 ? params[:per_page].to_i : 20
      model_class.page(page).per(per_page)
    end

end
