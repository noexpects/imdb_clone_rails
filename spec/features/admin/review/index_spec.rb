# frozen_string_literal: true

RSpec.describe 'Reviews index page', bullet: :skip do
  before do
    sign_in(create(:user, admin: true))
  end

  let!(:review1) { create(:review) }
  let!(:review2) { create(:review) }

  describe 'Reaching reviews page' do
    before do
      visit admin_reviews_path
    end

    it { expect(status_code).to be(200) }
  end

  describe 'Reviews table present' do
    before do
      visit admin_reviews_path
    end

    it { expect(page.has_css?('table')).to be true }
  end

  describe 'Reviews table has correct number of rows' do
    before do
      visit admin_reviews_path
    end

    it { expect(page.find_all('.js-table-row').count).to eq Review.count }
  end

  describe 'Edit action present' do
    before do
      visit admin_reviews_path
    end

    it { expect(page.has_css?('.action-edit')).to be true }
  end

  describe 'Edit works correctly' do
    let!(:review3) { create(:review) }

    before do
      review1.destroy!
      review2.destroy!
    end

    describe 'Edit' do
      before do
        visit admin_reviews_path
        page.find('.action-edit').click
      end

      it { expect(page).to have_current_path(edit_admin_review_path(review3)) }
    end
  end
end
