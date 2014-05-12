module Refinery
  module NewPlayerInquiries
    class NewPlayerInquiry < Refinery::Core::BaseModel
      self.table_name = 'refinery_new_player_inquiries'

      attr_accessible :name, :surname, :phone, :email, :age, :experience, :position

      alias_attribute :message, :experience

      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :name, :surname, :phone, :email, :age, :experience, :presence => true
      validates :phone, :age, :numericality => true
      validates :email, format: {
        with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      }

    end
  end
end
