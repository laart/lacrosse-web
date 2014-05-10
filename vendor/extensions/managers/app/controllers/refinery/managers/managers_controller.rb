module Refinery
  module Managers
    class ManagersController < ::ApplicationController

      before_filter :find_all_managers
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @manager in the line below:
        present(@page)
      end

      def show
        @manager = Manager.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @manager in the line below:
        present(@page)
      end

    protected

      def find_all_managers
        @managers = Manager.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/managers").first
      end

    end
  end
end
