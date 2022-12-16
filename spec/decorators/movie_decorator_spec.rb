# frozen_string_literal: true

RSpec.describe MovieDecorator do
  describe '#long_description?' do
    context 'when long description' do
      let(:character_count) { Constants::Movie::MAX_DESCRIPTION_LENGTH + 1 }
      let(:test_movie) { create(:movie, description: FFaker::Lorem.characters(character_count)).decorate }

      it { expect(test_movie.long_description?).to be(true) }
    end

    context 'when short description' do
      let(:test_movie) { create(:movie, description: FFaker::Lorem.characters(100)).decorate }

      it { expect(test_movie.long_description?).to be(false) }
    end
  end

  describe '#short_description' do
    let(:test_movie) { create(:movie, description: FFaker::Lorem.characters(350)).decorate }
    let(:short_description_length) { Constants::Movie::SHORT_DESCRIPTION_LENGTH }

    it { expect(test_movie.short_description).to eq(test_movie.description[...short_description_length]) }
  end

  describe '#reviewed_by_user?' do
    describe 'Success' do
      before do
        create(:review, user: user, movie: test_movie)
      end

      let(:test_movie) { create(:movie).decorate }
      let(:user) { create(:user) }

      it { expect(test_movie.reviewed_by_user?(user: user)).to be(true) }
    end

    describe 'Failure' do
      let(:test_movie) { create(:movie).decorate }
      let(:user) { create(:user) }

      it { expect(test_movie.reviewed_by_user?(user: user)).to be(false) }
    end
  end
end
