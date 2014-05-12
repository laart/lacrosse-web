module Refinery
  module NewPlayerInquiries
    class Mailer < ActionMailer::Base

      def confirmation(new_player_inquiry, request)
        @new_player_inquiry = new_player_inquiry
        mail :subject  => Refinery::NewPlayerInquiries::Setting.confirmation_subject,
             :to       => new_player_inquiry.email,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
             :reply_to => Refinery::NewPlayerInquiries::Setting.notification_recipients.split(',').first
      end

      def notification(new_player_inquiry, request)
        @new_player_inquiry = new_player_inquiry
        mail :subject  => Refinery::NewPlayerInquiries::Setting.notification_subject,
             :to       => Refinery::NewPlayerInquiries::Setting.notification_recipients,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>"
      end

    end
  end
end
