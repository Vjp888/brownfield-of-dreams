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
  end
end
