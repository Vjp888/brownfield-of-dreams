require 'rails_helper'

RSpec.describe 'API sequencer calls' do

  describe 'as an admin', :js => true do
    xit 'allows me to reorder videos and save that order' do
      admin = create(:admin)
      tutorial = create(:tutorial)
      video_1 = create(:video, tutorial_id: tutorial.id)
      video_2 = create(:video, tutorial_id: tutorial.id)
      video_3 = create(:video, tutorial_id: tutorial.id)

      visit '/'
      click_on "Sign In"
      fill_in 'session[email]', with: admin.email
      fill_in 'session[password]', with: admin.password
      click_on 'Log In'

      visit admin_dashboard_path

      click_link ('Edit')

      within('#video-list') do
        expect(page.all('.video')[0]).to have_content("#{video_1.title}")
        expect(page.all('.video')[1]).to have_content("#{video_2.title}")
      end
      within ('#video-list') do
        e1 = page.all('.video')[0]
        e2 = page.all('.video')[2]
        e1.drag_to(e2)
      end

      click_on 'Save Video Order'

      within('#video-list') do
        expect(page.all('.video')[0]).to have_content("#{video_2.title}")
        expect(page.all('.video')[1]).to have_content("#{video_1.title}")
      end
    end
  end
end
