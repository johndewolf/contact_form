require 'spec_helper'

feature 'User removes inquiry', %q{
  "As an admin
  I want to delete an inquiry
  So that I can remove spam or other undesirable inquiries"
} do
  context 'user choses inquiry to remove' do
    it 'removes the inquiry from the database' do
      # Inquiry.delete_all
      inquiry = FactoryGirl.create(:inquiry)
      visit '/inquiries'
      click_on 'Delete'
      expect(page).to_not have_content(inquiry.first_name)
    end
  end
end
