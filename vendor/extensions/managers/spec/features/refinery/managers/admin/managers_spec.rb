# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Managers" do
    describe "Admin" do
      describe "managers" do
        refinery_login_with :refinery_user

        describe "managers list" do
          before do
            FactoryGirl.create(:manager, :name => "UniqueTitleOne")
            FactoryGirl.create(:manager, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.managers_admin_managers_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.managers_admin_managers_path

            click_link "Add New Manager"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Managers::Manager.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Managers::Manager.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:manager, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.managers_admin_managers_path

              click_link "Add New Manager"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Managers::Manager.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:manager, :name => "A name") }

          it "should succeed" do
            visit refinery.managers_admin_managers_path

            within ".actions" do
              click_link "Edit this manager"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:manager, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.managers_admin_managers_path

            click_link "Remove this manager forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Managers::Manager.count.should == 0
          end
        end

      end
    end
  end
end
