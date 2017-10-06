# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Organizations" do
    describe "Admin" do
      describe "addresses", type: :feature do
        refinery_login

        describe "addresses list" do
          before do
            FactoryGirl.create(:address, :street1 => "UniqueTitleOne")
            FactoryGirl.create(:address, :street1 => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.organizations_admin_addresses_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.organizations_admin_addresses_path

            click_link "Add New Address"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Street1", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Organizations::Address, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Organizations::Address, :count)

              expect(page).to have_content("Street1 can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:address, :street1 => "UniqueTitle") }

            it "should fail" do
              visit refinery.organizations_admin_addresses_path

              click_link "Add New Address"

              fill_in "Street1", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Organizations::Address, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:address, :street1 => "A street1") }

          it "should succeed" do
            visit refinery.organizations_admin_addresses_path

            within ".actions" do
              click_link "Edit this address"
            end

            fill_in "Street1", :with => "A different street1"
            click_button "Save"

            expect(page).to have_content("'A different street1' was successfully updated.")
            expect(page).not_to have_content("A street1")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:address, :street1 => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.organizations_admin_addresses_path

            click_link "Remove this address forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Organizations::Address.count).to eq(0)
          end
        end

      end
    end
  end
end
