module Refinery
  module Events
    class RepeatingEvent < Refinery::Core::BaseModel

    	attr_accessor :title, :description, :important, :event_type
      attr_accessible :repeating_event_title, :position, :starttime, :endtime, :period, :frequency, :all_day, 
      								:title, :event_type, :important, :description

      has_many :events, :dependent => :destroy

		  after_create :create_events_until_end_time

		  def create_events_until_end_time(end_time=END_TIME)
		    st = starttime
		    et = endtime
		    p = r_period(period)
		    nst, net = st, et
		    
		    while frequency.send(p).from_now(st) <= end_time
		#      puts "#{nst}           :::::::::          #{net}" if nst and net
		      self.events.create(
		      	:title => title, 
		      	:starttime => nst, 
		      	:endtime => net, 
		      	:all_day => all_day, 
		      	:description => description, 
		      	:important => important,
		      	:event_type => event_type)
		      nst = st = frequency.send(p).from_now(st)
		      net = et = frequency.send(p).from_now(et)
		      
		      if period.downcase == 'monthly' or period.downcase == 'yearly'
		        begin 
		          nst = DateTime.parse("#{starttime.hour}:#{starttime.min}:#{starttime.sec}, #{starttime.day}-#{st.month}-#{st.year}")  
		          net = DateTime.parse("#{endtime.hour}:#{endtime.min}:#{endtime.sec}, #{endtime.day}-#{et.month}-#{et.year}")
		        rescue
		          nst = net = nil
		        end
		      end
		    end
		  end
		  
		  def r_period(period)
		    case period
		      when 'Daily'
		      p = 'days'
		      when "Weekly"
		      p = 'weeks'
		      when "Monthly"
		      p = 'months'
		      when "Yearly"
		      p = 'years'
		    end
		    return p
		  end

    end
  end
end
