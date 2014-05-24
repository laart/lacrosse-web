module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        before_filter :find_all_event_types
        crudify :'refinery/events/event',
                :xhr_paging => true,
                :order => "created_at DESC",
                :sortable => false

      protected

        def find_all_event_types
          @repeating_events = Refinery::Events::RepeatingEvent.all
        end

      end
    end
  end
end
