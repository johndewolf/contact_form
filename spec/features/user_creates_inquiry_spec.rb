require 'spec_helper'

feature 'User creates inquiry', %q{
  As a site visitor,
  I want to contact the site's staff,
  So that I can tell them how awesome they are
} do
  context "with valid attribute" do
    it "creates a contact inquiry" do
      visit '/inquiries'
      click_on "New Inquiry"

      visit '/inquiries/new'

      fill_in "First Name", with: "Samuel"
      fill_in "Last Name", with: "L. Jackson"
      fill_in "Email", with: "swears@yahoo.com"
      fill_in "Subject", with: 'You are awesome'
      fill_in "Description", with: "Thanks for being awesome"

    click_on "Create Inquiry"
    expect(page).to have_content "Inquiry was successfully saved"
    end
  end

  context "with missing attributes" do
    it "does not create contact inquiry if first name is missing" do
      visit '/inquiries/new'

      click_on "Create Inquiry"
      expect(page).to have_content "First name can't be blank"
      expect(page).to have_content "Last name can't be blank"
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Subject can't be blank"
      expect(page).to have_content "Description can't be blank"

    end
  end
end
