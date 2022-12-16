# frozen_string_literal: true

RSpec.describe 'Movie create page', bullet: :skip, driver: :chrome do
  before do
    sign_in(create(:user, admin: true))
  end

  let!(:category) { create(:category) }
  let(:movie_attributes) { attributes_for(:movie) }

  describe 'Success' do
    before do
      visit new_admin_movie_path

      fill_in('movie_title', with: movie_attributes[:title])
      fill_in('movie_description', with: movie_attributes[:description])
      fill_in('Category', with: category.name).native.send_keys(:return)

      click_on('commit')
    end

    it { expect(Movie.all.count).to be(1) }
    it { expect(page.has_css?('.flash-notice')).to be true }
  end

  describe 'Failure' do
    context 'when no name passed' do
      before do
        visit new_admin_category_path

        click_on('commit')
      end

      it { expect(Movie.all.count).to be(0) }
      it { expect(page.has_css?('.flash-error')).to be true }
    end
  end
end
