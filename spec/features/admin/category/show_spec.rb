# frozen_string_literal: true

RSpec.describe 'Category show page', bullet: :skip do
  before do
    sign_in(create(:user, admin: true))
    visit admin_category_path(category)
  end

  let!(:category) { create(:category) }

  describe 'Reaching show page' do
    it { expect(status_code).to be(200) }
  end

  describe 'Category show page has correct attributes' do
    it { expect(page.has_css?('#id')).to be true }
    it { expect(page.has_css?('#movies')).to be true }
    it { expect(page.has_css?('#name')).to be true }
    it { expect(page.has_css?('#slug')).to be true }
    it { expect(page.has_css?('#created_at')).to be true }
    it { expect(page.has_css?('#updated_at')).to be true }
  end
end
