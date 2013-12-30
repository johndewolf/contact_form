require 'spec_helper'

feature 'User sees all inquiries', %q{
  As an admin
  I want to review contact inquiries
  So that I can respond or take action
} do

  context 'views full list of inquiries' do
    it 'views all inquiries' do
      inquiry1 = FactoryGirl.create(:inquiry, first_name: 'Anderson1')
      inquiry2 = FactoryGirl.create(:inquiry, first_name: 'Anderson2')
      inquiry3 = FactoryGirl.create(:inquiry, first_name: 'Anderson3')

      visit '/inquiries'
      expect(page).to have_content(inquiry1.first_name)
      expect(page).to have_content(inquiry2.first_name)
      expect(page).to have_content(inquiry3.first_name)
    end
  end
end
