module Refinery
  module Managers
    module Admin
      class ManagersController < ::Refinery::AdminController

        crudify :'refinery/managers/manager',
                :title_attribute => 'name',
                :xhr_paging => true

      end
    end
  end
end
