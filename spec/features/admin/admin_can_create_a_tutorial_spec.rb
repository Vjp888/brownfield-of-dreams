require 'rails_helper'

RSpec.describe 'new tutorial spec' do
  context 'as an admin' do
    it 'can create a new tutorial' do
      admin = create(:user, role: 'admin')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_tutorial_path

      fill_in 'Title', with: 'Test Title'
      fill_in 'Description', with: 'Test Description'
      fill_in 'Thumbnail', with: 'https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg'

      click_on 'Save'

      tutorial = Tutorial.last

      expect(current_path).to eq(edit_admin_tutorial_path(tutorial))
      expect(tutorial.title).to eq('Test Title')
      expect(tutorial.description).to eq('Test Description')
      expect(tutorial.thumbnail).to eq('https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg')
    end
  end
end
