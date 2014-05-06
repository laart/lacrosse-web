require 'spec_helper'

module Refinery
  module Achievements
    describe Achievement do
      describe "validations" do
        subject do
          FactoryGirl.create(:achievement,
          :tournament => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:tournament) { should == "Refinery CMS" }
      end
    end
  end
end
