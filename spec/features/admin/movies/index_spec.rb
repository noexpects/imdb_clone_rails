# frozen_string_literal: true

RSpec.describe 'Movies index page', bullet: :skip do
  before do
    sign_in(create(:user, admin: true))
  end

  let!(:movie1) { create(:movie) }
  let!(:movie2) { create(:movie) }

  describe 'Reaching movies page' do
    before do
      visit admin_movies_path
    end

    it { expect(status_code).to be(200) }
  end

  describe 'Movies table present' do
    before do
      visit admin_categories_path
    end

    it { expect(page.has_css?('table')).to be true }
  end

  describe 'Movies table has correct number of rows' do
    before do
      visit admin_categories_path
    end

    it { expect(page.find_all('.js-table-row').count).to eq Movie.count }
  end

  describe 'Edit action present' do
    before do
      visit admin_categories_path
    end

    it { expect(page.has_css?('.action-edit')).to be true }
  end

  describe 'Edit works correctly' do
    let!(:movie3) { create(:movie) }

    before do
      movie1.destroy!
      movie2.destroy!
    end

    describe 'Edit' do
      before do
        visit admin_movies_path
        click_on('Edit')
      end

      it { expect(page).to have_current_path(edit_admin_movie_path(movie3)) }
    end
  end
end
