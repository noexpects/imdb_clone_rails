# frozen_string_literal: true

RSpec.describe 'User sign out' do
  let(:user) { create(:user) }

  before do
    sign_in user
    visit root_path
    click_on('logout_btn')
  end

  describe 'Redirect works correctly', driver: :chrome do
    it { expect(page).to have_current_path(root_path) }
    it { expect(page.has_css?('#notice_message')).to be true }
  end
end
