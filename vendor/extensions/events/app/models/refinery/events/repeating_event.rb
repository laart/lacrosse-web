module Refinery
  module Events
    class RepeatingEvent < Refinery::Core::BaseModel

      attr_accessible :repeating_event_title, :position

      validates :repeating_event_title, :presence => true, :uniqueness => true

      has_many :events
    end
  end
end
