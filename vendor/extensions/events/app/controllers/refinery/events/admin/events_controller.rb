module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        def index
          @events = Refinery::Events::Event.where("repeating_event_id IS ?", nil)
          @repeating_events = Refinery::Events::RepeatingEvent.all
        end

        def new
          @event = Refinery::Events::Event.new(:starttime => Time.now, :endtime => 1.hour.from_now, :period => "Does not repeat")            
        end

        def edit
          @event = Refinery::Events::Event.find(params[:id])
        end

        def create
          if params[:event][:period] == "Does not repeat"
            @event = Refinery::Events::Event.new(params[:event])

            respond_to do |format|
              if @event.save
                format.html { redirect_to refinery.events_admin_events_path, notice: 'Notikums veiksmigi izveidots' }
                format.json { head :no_content }
              else
                format.html { render action: "new" }
                format.json { render json: @event.full_messages.to_sentence, status: :unprocessable_entity }
              end
            end

          else
            @event = Refinery::Events::RepeatingEvent.new(params[:event])

            respond_to do |format|
              if @event.save
                format.html { redirect_to refinery.events_admin_events_path, notice: 'Atkartotais notikums veiksmigi izveidots' }
                format.json { head :no_content }
              else
                format.html { redirect_to refinery.new_events_admin_event_path }
                format.json { render json: @event.full_messages.to_sentence, status: :unprocessable_entity }
              end
            end
          end

        end

        def update
          @event = Refinery::Events::Event.find(params[:id])

          respond_to do |format|
            if @event.update_attributes(params[:event])
              format.html { redirect_to refinery.events_admin_events_path, notice: 'Notikums veiksmigi labots' }
              format.json { head :no_content }
            else
              format.html { render action: "edit" }
              format.json { render json: @event.full_messages.to_sentence, status: :unprocessable_entity }
            end
          end
        end

        def destroy
          @event = Refinery::Events::Event.find(params[:id])
          @event.destroy
          redirect_to refinery.events_admin_events_path, :flash => { :notice => "Notikums veiksmigi dzests" }
        end

      end
    end
  end
end
