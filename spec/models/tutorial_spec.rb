require 'rails_helper'

RSpec.describe Tutorial, type: :model do
  describe 'class methods' do
    it '.class_content' do
      non_class_tut = create(:tutorial)
      class_tut = create(:tutorial, classroom: true)
      class_tut2 = create(:tutorial, classroom: true)

      expect(Tutorial.class_content).to eq([class_tut, class_tut2])
    end

    it '.non_class_content' do
      non_class_tut = create(:tutorial)
      non_class_tut2 = create(:tutorial)
      class_tut = create(:tutorial, classroom: true)

      expect(Tutorial.non_class_content).to eq([non_class_tut, non_class_tut2])
    end

    it '.bookmarked_by' do
      tutorial1 = create(:tutorial)
      tutorial2 = create(:tutorial)
      tutorial3 = create(:tutorial)
      video1 = create(:video, tutorial: tutorial1)
      video2 = create(:video, tutorial: tutorial2)
      video3 = create(:video, tutorial: tutorial3)
      user = create(:user)
      UserVideo.create(user: user, video: video1)
      UserVideo.create(user: user, video: video2)

      expect(Tutorial.bookmarked_by(user)).to eq([tutorial1, tutorial2])
    end
  end

  describe 'intance methods' do
    it '.bookmarked_tutorial_videos' do
      tutorial1 = create(:tutorial)
      tutorial2 = create(:tutorial)
      video1 = create(:video, tutorial: tutorial1)
      video2 = create(:video, tutorial: tutorial2, position: 1)
      video3 = create(:video, tutorial: tutorial2, position: 2)
      video4 = create(:video, tutorial: tutorial2, position: 3)
      user = create(:user)
      UserVideo.create(user: user, video: video1)
      UserVideo.create(user: user, video: video2)
      UserVideo.create(user: user, video: video4)
      
      expect(tutorial1.bookmarked_tutorial_videos(user)).to eq([video1])
      expect(tutorial2.bookmarked_tutorial_videos(user)).to eq([video2, video4])
    end
  end
end
