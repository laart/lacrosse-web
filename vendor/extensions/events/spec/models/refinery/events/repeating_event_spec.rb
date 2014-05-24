require 'spec_helper'

module Refinery
  module Events
    describe RepeatingEvent do
      describe "validations" do
        subject do
          FactoryGirl.create(:repeating_event,
          :repeating_event_title => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:repeating_event_title) { should == "Refinery CMS" }
      end
    end
  end
end
