# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Achievements" do
    describe "Admin" do
      describe "achievements" do
        refinery_login_with :refinery_user

        describe "achievements list" do
          before do
            FactoryGirl.create(:achievement, :tournament => "UniqueTitleOne")
            FactoryGirl.create(:achievement, :tournament => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.achievements_admin_achievements_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.achievements_admin_achievements_path

            click_link "Add New Achievement"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Tournament", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Achievements::Achievement.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Tournament can't be blank")
              Refinery::Achievements::Achievement.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:achievement, :tournament => "UniqueTitle") }

            it "should fail" do
              visit refinery.achievements_admin_achievements_path

              click_link "Add New Achievement"

              fill_in "Tournament", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Achievements::Achievement.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:achievement, :tournament => "A tournament") }

          it "should succeed" do
            visit refinery.achievements_admin_achievements_path

            within ".actions" do
              click_link "Edit this achievement"
            end

            fill_in "Tournament", :with => "A different tournament"
            click_button "Save"

            page.should have_content("'A different tournament' was successfully updated.")
            page.should have_no_content("A tournament")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:achievement, :tournament => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.achievements_admin_achievements_path

            click_link "Remove this achievement forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Achievements::Achievement.count.should == 0
          end
        end

      end
    end
  end
end
