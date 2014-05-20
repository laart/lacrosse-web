# encoding: UTF-8
module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :title, :start_time, :end_time, :event_type, :description, :all_day

      validates :title, :presence => true

      EVENT_TYPES = [["Treniņs", "Training"], ["Spēle", "Game"], ["Pasākums", "Party"], 
      ["Sapulce","Meeting"], ["Dzimšanas/Vārda diena" ,"Birthday"], ["Citi", "Other"]]

      def as_json(options = {})
		    {
		      :id => self.id,
		      :title => self.title,
		      :type => self.event_type || "",
		      :start => start_time.iso8601,
		      :end => end_time.iso8601,
		      :allDay => self.all_day,
		      :recurring => false,
		      :color => event_color,
		      :description => self.description

		      # :url => Rails.application.routes.url_helpers.event_path(id)
		    }
  		end

  		def event_color
		  	case self.event_type
		  	when "Game"
		  		"red"
		  	when "Training"
		  		"green"
		  	when "Party"
		  		"#cd1076"
		  	when "Meeting"
		  		"Blue"
		  	when "Birthday"
		  		"#b23aee"
		  	else
		  		"#006638"
		  	end
		  end

    end
  end
end
