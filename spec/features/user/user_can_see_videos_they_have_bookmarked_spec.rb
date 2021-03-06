require 'rails_helper'

RSpec.describe 'when a user has bookmarked videos' do
  context 'and they visit their dashboard' do
    it 'shows their bookmarked videos', :vcr do
      tutorial1 = create(:tutorial)
      tutorial2 = create(:tutorial)
      video1 = create(:video, tutorial: tutorial1)
      video2 = create(:video, tutorial: tutorial2)
      video3 = create(:video, tutorial: tutorial2)
      user = create(:user)
      UserVideo.create(user: user, video: video1)
      UserVideo.create(user: user, video: video2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_path

      within '.bookmarks' do
        expect(page).to have_link("#{video1.title}")
        click_link "#{video2.title}"
      end

      expect(current_path).to eq(api_v1_video_path(video2))
    end
  end
end
