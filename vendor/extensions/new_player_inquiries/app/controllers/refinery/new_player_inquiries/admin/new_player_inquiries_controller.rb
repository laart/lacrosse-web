module Refinery
  module NewPlayerInquiries
    module Admin
      class NewPlayerInquiriesController < Refinery::AdminController

        crudify :'refinery/new_player_inquiries/new_player_inquiry', 
                :title_attribute => "name", 
                :order => "created_at DESC"

        def index
          unless searching?
            find_all_new_player_inquiries
          else
            search_all_new_player_inquiries
          end

          @grouped_new_player_inquiries = group_by_date(@new_player_inquiries)
        end

      end
    end
  end
end
