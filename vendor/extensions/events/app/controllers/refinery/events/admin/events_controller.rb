module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        def index
          @events = Refinery::Events::Event.all
          @single_events = Refinery::Events::Event.where("repeating_event_id IS ?", nil)
          @repeating_events = Refinery::Events::RepeatingEvent.all
        end

        def new
          @event = Refinery::Events::Event.new(:endtime => 1.hour.from_now, :period => "Does not repeat")            
        end

        def edit
          @event = Refinery::Events::Event.find(params[:id])
        end

        def create
          if params[:event][:period] == "Does not repeat"

            @event = Refinery::Events::Event.new(params[:event])
            if @event.save
              #redirect_to events_path
            else
              render :text => @event.errors.full_messages.to_sentence, :status => 422
            end

          else
            @repeating_event = Refinery::Events::RepeatingEvent.new(params[:event])
            if @repeating_event.save
              #redirect_to events_path
            else
              render :text => @repeating_event.errors.full_messages.to_sentence, :status => 422
            end
          end
        end

        def update
          @event = Refinery::Events::Event.find(params[:id])

          respond_to do |format|
            if @event.update_attributes(params[:event])
              format.html { redirect_to @event, notice: 'Event was successfully updated.' }
              format.json { head :no_content }
            else
              format.html { render action: "edit" }
              format.json { render json: @event.errors, status: :unprocessable_entity }
            end
          end
        end

        def destroy
          @event = Refinery::Events::Event.find(params[:id])
          @event.destroy

          respond_to do |format|
            format.html { redirect_to events_url }
            format.json { head :no_content }
          end
        end

      end
    end
  end
end
