module Refinery
  module Events
    class RepeatingEventsController < ::ApplicationController

      before_filter :find_all_repeating_events
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @repeating_event in the line below:
        present(@page)
      end

      def show
        @repeating_event = RepeatingEvent.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @repeating_event in the line below:
        present(@page)
      end

    protected

      def find_all_repeating_events
        @repeating_events = RepeatingEvent.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/repeating_events").first
      end

    end
  end
end
