# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Events" do
    describe "Admin" do
      describe "repeating_events" do
        refinery_login_with :refinery_user

        describe "repeating_events list" do
          before do
            FactoryGirl.create(:repeating_event, :repeating_event_title => "UniqueTitleOne")
            FactoryGirl.create(:repeating_event, :repeating_event_title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.events_admin_repeating_events_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.events_admin_repeating_events_path

            click_link "Add New Repeating Event"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Repeating Event Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Events::RepeatingEvent.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Repeating Event Title can't be blank")
              Refinery::Events::RepeatingEvent.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:repeating_event, :repeating_event_title => "UniqueTitle") }

            it "should fail" do
              visit refinery.events_admin_repeating_events_path

              click_link "Add New Repeating Event"

              fill_in "Repeating Event Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Events::RepeatingEvent.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:repeating_event, :repeating_event_title => "A repeating_event_title") }

          it "should succeed" do
            visit refinery.events_admin_repeating_events_path

            within ".actions" do
              click_link "Edit this repeating event"
            end

            fill_in "Repeating Event Title", :with => "A different repeating_event_title"
            click_button "Save"

            page.should have_content("'A different repeating_event_title' was successfully updated.")
            page.should have_no_content("A repeating_event_title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:repeating_event, :repeating_event_title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.events_admin_repeating_events_path

            click_link "Remove this repeating event forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Events::RepeatingEvent.count.should == 0
          end
        end

      end
    end
  end
end
