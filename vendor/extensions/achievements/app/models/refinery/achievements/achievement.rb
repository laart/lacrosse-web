module Refinery
  module Achievements
    class Achievement < Refinery::Core::BaseModel
      self.table_name = 'refinery_achievements'

      attr_accessible :tournament, :country, :place, :description, :position, :date

      validates :tournament, :country, :place, :position, presence: true
    end
  end
end
