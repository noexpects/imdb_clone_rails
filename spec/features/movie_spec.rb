# frozen_string_literal: true

RSpec.describe 'Movie page' do
  let!(:movie) { create(:movie) }

  describe 'Reaching movie page' do
    before do
      visit movie_path(movie)
    end

    it { expect(status_code).to be(200) }
  end

  describe 'There is correct rating on the page' do
    let(:movie_on_page_rating) { page.find_by_id('movie_rating').text[-3..] }

    before do
      visit movie_path(movie)
    end

    it { expect(movie_on_page_rating).to eq(movie.rating.to_s) }
  end

  describe 'There is correct title on the page' do
    let(:movie_on_page_title) { page.find_by_id('movie_title').text }

    before do
      visit movie_path(movie)
    end

    it { expect(movie_on_page_title).to eq(movie.title) }
  end

  describe 'There is correct description on the page' do
    let(:movie_on_page_description) { page.find_by_id('description').text[...-10] }

    before do
      visit movie_path(movie)
    end

    it { expect(movie_on_page_description).to eq(movie.decorate.short_description) }
  end

  describe 'Check back to results link works' do
    before do
      visit movie_path(movie)
      click_on(I18n.t(:'movie_page.to_catalog_link_text'))
    end

    it { expect(page).to have_current_path(root_path) }
  end
end
