module Refinery
  module NewPlayerInquiries
    class Setting < Refinery::Core::BaseModel

      class << self
        def confirmation_body
          Refinery::Setting.find_or_set(:new_player_inquiry_confirmation_body,
            "Thank you for your new player inquiry %name%,\n\nThis email is a receipt to confirm we have received your new player inquiry and we'll be in touch shortly.\n\nThanks."
          )
        end

        def confirmation_subject
          Refinery::Setting.find_or_set(:new_player_inquiry_confirmation_subject,
                                        "Thank you for your new player inquiry")
        end

        def confirmation_subject=(value)
          Refinery::Setting.set(:new_player_inquiry_confirmation_subject, value)
        end

        def notification_recipients
          Refinery::Setting.find_or_set(:new_player_inquiry_notification_recipients,
                                        (Role[:refinery].users.first.try(:email) if defined?(Role)).to_s)
        end

        def notification_subject
          Refinery::Setting.find_or_set(:new_player_inquiry_notification_subject,
                                        "New new player inquiry from your website")
        end
      end

    end
  end
end
