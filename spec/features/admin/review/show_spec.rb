# frozen_string_literal: true

RSpec.describe 'Review show page', bullet: :skip do
  before do
    sign_in(create(:user, admin: true))
    visit admin_review_url(review)
  end

  let!(:review) { create(:review) }

  describe 'Reaching show page' do
    it { expect(status_code).to be(200) }
  end

  describe 'Review show page has correct attributes' do
    it { expect(page.has_css?('#id')).to be true }
    it { expect(page.has_css?('#movie')).to be true }
    it { expect(page.has_css?('#score')).to be true }
    it { expect(page.has_css?('#user')).to be true }
    it { expect(page.has_css?('#created_at')).to be true }
    it { expect(page.has_css?('#updated_at')).to be true }
  end
end
