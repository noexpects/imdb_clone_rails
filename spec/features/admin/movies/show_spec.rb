# frozen_string_literal: true

RSpec.describe 'Movie show page', bullet: :skip do
  before do
    sign_in(create(:user, admin: true))
    visit admin_movie_url(movie)
  end

  let!(:movie) { create(:movie) }

  describe 'Reaching show page' do
    it { expect(status_code).to be(200) }
  end

  describe 'Movie show page has correct attributes' do
    it { expect(page.has_css?('#id')).to be true }
    it { expect(page.has_css?('#category')).to be true }
    it { expect(page.has_css?('#title')).to be true }
    it { expect(page.has_css?('#slug')).to be true }
    it { expect(page.has_css?('#created_at')).to be true }
    it { expect(page.has_css?('#updated_at')).to be true }
  end
end
