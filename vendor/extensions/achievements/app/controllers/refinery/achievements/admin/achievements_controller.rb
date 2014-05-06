module Refinery
  module Achievements
    module Admin
      class AchievementsController < ::Refinery::AdminController

        crudify :'refinery/achievements/achievement',
                :title_attribute => 'tournament',
                :xhr_paging => true

      end
    end
  end
end
