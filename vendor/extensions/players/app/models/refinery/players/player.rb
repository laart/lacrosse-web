module Refinery
  module Players
    class Player < Refinery::Core::BaseModel
      self.table_name = 'refinery_players'

      attr_accessible :name, :surname, :email, :age, :position, :number, :height, :city, :description, :photo_id,
      :draugiem, :twitter, :facebook, :googleplus

			belongs_to :photo, :class_name => '::Refinery::Image'

			validates :name, :surname, :email, :age, :position, :number, :height, :city, :description, :photo_id, presence: true
			validates :age, :number, :height, numericality: true
			validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
    end
  end
end
