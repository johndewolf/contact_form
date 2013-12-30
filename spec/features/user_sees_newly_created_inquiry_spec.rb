require 'spec_helper'

feature 'User can see newly created inquiry', %q{
  As a site visitor,
  I want to see the inquiry,
  So that I can edit the inquiry or go back to inquiry list
} do
  context "with created inquiry" do
    it "edits a contact inquiry" do
      inquiry = FactoryGirl.create(:inquiry)
      visit "/inquiries/#{inquiry[:id]}"

    click_on "Edit"
    expect(page).to have_content "Edit Inquiry"
    end
  end

  context 'after update, going back to inquiries page' do
    it 'user is able to navigate back to inquiries page' do
      inquiry = FactoryGirl.create(:inquiry)
      visit "/inquiries/#{inquiry[:id]}"

      click_on "Inquiries"
      expect(page).to have_content("All Inquiries")
    end
  end
end
