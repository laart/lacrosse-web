module Refinery
  module Galleries
    class GalleriesController < ::ApplicationController

      before_filter :find_all_galleries, :find_videos
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @gallery in the line below:
        present(@page)
      end

      def show
        @gallery = Gallery.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @gallery in the line below:
        present(@page)
      end

    protected

      def find_all_galleries
        @galleries = Gallery.order('position DESC').page(params[:page]).per_page(9)
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/galleries").first
      end

      def find_videos
        @videos = Refinery::Videos::Video.order('created_at desc')
      end

    end
  end
end
