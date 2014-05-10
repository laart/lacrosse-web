module Refinery
  module Managers
    class Manager < Refinery::Core::BaseModel
      self.table_name = 'refinery_managers'

      attr_accessible :name, :surname, :position, :telephone_number, :email, :in_contatcs, :position, :photo_id

      belongs_to :photo, :class_name => '::Refinery::Image'
      validates :name, :presence => true
    end
  end
end
