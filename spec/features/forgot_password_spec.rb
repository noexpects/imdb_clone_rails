# frozen_string_literal: true

RSpec.describe 'Forgot password page' do
  let(:user) { create(:user) }

  before do
    visit new_user_password_path
  end

  describe 'Success' do
    describe 'Redirect works correctly' do
      before do
        fill_in('user_email', with: user.email)
        click_on('submit_btn')
      end

      it { expect(status_code).to be(200) }
      it { expect(page).to have_current_path(new_user_session_path) }
    end

    describe 'Notice message present' do
      before do
        fill_in('user_email', with: user.email)
        click_on('submit_btn')
      end

      it { expect(status_code).to be(200) }
      it { expect(page.has_css?('#notice_message')).to be true }
    end
  end

  describe 'Failure' do
    describe 'No redirect' do
      before do
        click_on('submit_btn')
      end

      it { expect(status_code).to be(200) }

      it { expect(page).to have_current_path(user_password_path) }
    end
  end
end
