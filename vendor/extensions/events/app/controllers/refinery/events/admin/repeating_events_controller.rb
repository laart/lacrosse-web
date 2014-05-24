module Refinery
  module Events
    module Admin
      class RepeatingEventsController < ::Refinery::AdminController

        crudify :'refinery/events/repeating_event',
                :title_attribute => 'repeating_event_title',
                :xhr_paging => true

      end
    end
  end
end
