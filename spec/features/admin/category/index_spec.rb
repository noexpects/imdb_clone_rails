# frozen_string_literal: true

RSpec.describe 'Categories index page', bullet: :skip do
  before do
    sign_in(create(:user, admin: true))
  end

  let!(:category1) { create(:category) }
  let!(:category2) { create(:category) }

  describe 'Reaching category page' do
    before do
      visit admin_categories_path
    end

    it { expect(status_code).to be(200) }
  end

  describe 'Categories table present' do
    before do
      visit admin_categories_path
    end

    it { expect(page.has_css?('table')).to be true }
  end

  describe 'Categories table has correct number of rows' do
    before do
      visit admin_categories_path
    end

    it { expect(page.find_all('.js-table-row').count).to eq Category.count }
  end

  describe 'Edit action present' do
    before do
      visit admin_categories_path
    end

    it { expect(page.has_css?('.action-edit')).to be true }
  end

  describe 'Edit works correctly' do
    let!(:category3) { create(:category) }
    let(:category3_url) { "#{admin_categories_path}/#{category3.slug}" }

    before do
      category1.destroy!
      category2.destroy!
    end

    describe 'Edit' do
      before do
        visit admin_categories_path
        page.find('.action-edit').click
      end

      it { expect(page).to have_current_path("#{category3_url}/edit") }
    end
  end
end
