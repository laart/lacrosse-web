module Refinery
  module Achievements
    class AchievementsController < ::ApplicationController

      before_filter :find_all_achievements
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @achievement in the line below:
        present(@page)
      end

      def show
        @achievement = Achievement.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @achievement in the line below:
        present(@page)
      end

    protected

      def find_all_achievements
        @achievements = Achievement.order('date DESC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/achievements").first
      end

    end
  end
end
