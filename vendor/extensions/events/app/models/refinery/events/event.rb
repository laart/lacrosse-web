# encoding: UTF-8
module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessor :period, :frequency, :repeating_event_title, :commit_button
      attr_accessible :title, :starttime, :endtime, :event_type, :description, :all_day, :repeating_event_id, :important, :period

      validates :title, :presence => true

      belongs_to :repeating_event


      EVENT_TYPES = [["Treniņs", "Training"], ["Spēle", "Game"], ["Pasākums", "Party"], 
      ["Sapulce","Meeting"], ["Dzimšanas/Vārda diena" ,"Birthday"], ["Citi", "Other"]]

      def as_json(options = {})
		    {
		      :id => self.id,
		      :title => self.title,
		      :type => self.event_type || "",
		      :start => starttime.iso8601,
		      :end => endtime.iso8601,
		      :allDay => self.all_day,
		      :borderColor => important_events,
		      :color => event_color,
		      :description => self.description

		      # :url => Rails.application.routes.url_helpers.event_path(id)
		    }
  		end

  		REPEATS = [
		              "Does not repeat",
		              "Daily"          ,
		              "Weekly"         ,
		              "Monthly"        ,
		              "Yearly"         
		  ]

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

		  def important_events
		    if self.important
		      "red"
		    end
		  end

    end
  end
end
