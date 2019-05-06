require 'rails_helper'

RSpec.describe 'Visitor' do
  describe 'When I navigate to /about' do
    it 'shows the about page for the application' do
      visit about_path

      expect(page).to have_content("This application is designed to pull in youtube information")
    end
  end
end
