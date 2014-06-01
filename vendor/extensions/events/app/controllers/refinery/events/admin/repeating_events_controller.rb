module Refinery
  module Events
    module Admin
      class RepeatingEventsController < ::Refinery::AdminController


      	def show
      		@repeating_event = Refinery::Events::RepeatingEvent.find(params[:id])
      	end

      	 def index
      		@repeating_events = Refinery::Events::RepeatingEvent.all
      	end

        def destroy
          @repeating_event = Refinery::Events::RepeatingEvent.find(params[:id])
          @repeating_event.destroy
          redirect_to refinery.events_admin_events_path, :flash => { :notice => "Atkartojosais notikums veiksmigi dzests" }
        end

      end
    end
  end
end
