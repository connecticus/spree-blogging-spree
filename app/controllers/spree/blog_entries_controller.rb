module Spree
  class BlogEntriesController < Spree::StoreController
    helper 'spree/blog_entries'

    before_filter :init_pagination, :only => [:index, :tag, :archive, :author, :category]
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404

    def index

      #the posts - pagination must be by 9 for correct page layout  
      blog_entries = Spree::BlogEntry.where(
        :id => Spree::BlogEntry.visible(params[:env]).offset(1)
      ).page(@pagination_page).per(@pagination_per_page)
      
      hero_entry = Spree::BlogEntry.visible(params[:env]).limit(1)
      # combine to single collection
      @blog_entries =  hero_entry + blog_entries


      # pagination
      next_page_count = Spree::BlogEntry.visible.page(@pagination_page+1).per(@pagination_per_page).offset(1).count
      @has_more_pages = (next_page_count > 0 ? true : false)
     
    end

    def show
      if try_spree_current_user.try(:has_spree_role?, "admin")
        @blog_entry = Spree::BlogEntry.find_by_permalink!(params[:slug])
      else
        @blog_entry = Spree::BlogEntry.visible.find_by_permalink!(params[:slug])
      end
      @title = @blog_entry.title
      @more_blog_entries = Spree::BlogEntry.visible.published_after(@blog_entry.published_at).limit(9)
      @previous_blog_entry = @more_blog_entries.first || Spree::BlogEntry.visible.first
      @next_blog_entry = Spree::BlogEntry.visible.published_before(@blog_entry.published_at).first || Spree::BlogEntry.visible.last
    end

    def tag
      @blog_entries = Spree::BlogEntry.visible.by_tag(params[:tag]).page(@pagination_page).per(@pagination_per_page)
      @tag_name = params[:tag]
    end

    def categories
      @categories = Spree::BlogEntry.category_counts
    end

    def category  

      #the posts - pagination must be by 9 for correct page layout  
      blog_entries = Spree::BlogEntry.where(
          :id => Spree::BlogEntry.visible(params[:env]).by_category(params[:category]).offset(1)
      ).page(@pagination_page).per(@pagination_per_page)
                  
      hero_entry = Spree::BlogEntry.visible(params[:env]).by_category(params[:category]).limit(1)
      # combine to single collection
      @blog_entries =  hero_entry + blog_entries


      # pagination
      next_page_count = Spree::BlogEntry.visible.by_category(params[:category]).page(@pagination_page+1).per(@pagination_per_page).offset(1).count
      @has_more_pages = (next_page_count > 0 ? true : false)

 
      # category info
      @category_name = params[:category]
      unparameterized_name = @category_name.split("-").join(" ").humanize
      @category_object = ActsAsTaggableOn::Tag.named_like(unparameterized_name)
      
    end

    def archive
      @blog_entries = Spree::BlogEntry.visible.by_date(params).page(@pagination_page).per(@pagination_per_page)
    end

    def feed
      @blog_entries = Spree::BlogEntry.visible.limit(20)
      render :layout => false
    end

    def author
      @author = Spree.user_class.where(:nickname => params[:author]).first
      @blog_entries = Spree::BlogEntry.visible.by_author(@author).page(@pagination_page).per(@pagination_per_page)
    end

    private

      def init_pagination
        @pagination_page = params[:page].to_i > 0 ? params[:page].to_i : 1
        @pagination_per_page = params[:per_page].to_i > 0 ? params[:per_page].to_i : 9
      end
  end
end