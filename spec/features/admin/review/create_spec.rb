# frozen_string_literal: true

RSpec.describe 'Review create page', bullet: :skip, driver: :chrome do
  before do
    sign_in(create(:user, admin: true))
  end

  let!(:movie) { create(:movie) }
  let!(:user) { create(:user) }
  let(:review_attributes) { attributes_for(:review) }

  describe 'Success' do
    before do
      visit new_admin_review_path
      fill_in 'Score', with: review_attributes[:score]
      fill_in('Movie', with: movie.title).native.send_keys(:return)
      fill_in('User', with: user.email).native.send_keys(:return)

      click_on('commit')
    end

    it { expect(Review.all.count).to be(1) }
    it { expect(page.has_css?('.flash-notice')).to be true }
  end

  describe 'Failure' do
    context 'when no score passed' do
      before do
        visit new_admin_review_path
        fill_in('Movie', with: movie.title).native.send_keys(:return)
        fill_in('User', with: user.email).native.send_keys(:return)
        click_on('commit')
      end

      it { expect(Review.all.count).to be(0) }
      it { expect(page.has_css?('.flash-error')).to be true }
    end

    context 'when no movie passed' do
      before do
        visit new_admin_review_path
        fill_in 'Score', with: review_attributes[:score]
        fill_in('User', with: user.email).native.send_keys(:return)
        click_on('commit')
      end

      it { expect(Review.all.count).to be(0) }
      it { expect(page.has_css?('.flash-error')).to be true }
    end

    context 'when no user passed' do
      before do
        visit new_admin_review_path
        fill_in 'Score', with: review_attributes[:score]
        fill_in('Movie', with: movie.title).native.send_keys(:return)
        click_on('commit')
      end

      it { expect(Review.all.count).to be(0) }
      it { expect(page.has_css?('.flash-error')).to be true }
    end
  end
end
