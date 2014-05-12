module Refinery
  module Managers
    class Manager < Refinery::Core::BaseModel
      self.table_name = 'refinery_managers'

      attr_accessible :name, :surname, :position, :telephone_number, :email, :in_contatcs, :position, :photo_id

      belongs_to :photo, :class_name => '::Refinery::Image'
      validates :name, :surname, :position, :telephone_number, :email, :photo_id, :presence => true
      validates :telephone_number, numericality: true
      validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
    end
  end
end
