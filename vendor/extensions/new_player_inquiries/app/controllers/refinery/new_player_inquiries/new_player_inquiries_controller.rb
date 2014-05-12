module Refinery
  module NewPlayerInquiries
    class NewPlayerInquiriesController < ::ApplicationController

      before_filter :find_page, :only => [:create, :new]

      def index
        redirect_to :action => "new"
      end

      def thank_you
        @page = Refinery::Page.find_by_link_url("/new_player_inquiries/thank_you", :include => [:parts])
      end

      def new
        @new_player_inquiry = NewPlayerInquiry.new
      end

      def create
        @new_player_inquiry = NewPlayerInquiry.new(params[:new_player_inquiry])

        if @new_player_inquiry.save
          begin
            Mailer.notification(@new_player_inquiry, request).deliver
          rescue => e
            logger.warn "There was an error delivering the new_player_inquiry notification.\n#{e.message}\n"
          end

          if NewPlayerInquiry.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@new_player_inquiry, request).deliver
            rescue => e
              logger.warn "There was an error delivering the new_player_inquiry confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to NewPlayerInquiry if you wish to send confirmation emails when forms are submitted."
          end

          redirect_to refinery.thank_you_new_player_inquiries_new_player_inquiries_path
        else
          render :action => 'new'
        end
      end

    protected

      def find_page
        @page = Refinery::Page.find_by_link_url('/new_player_inquiries/new', :include => [:parts])
      end

    end
  end
end
