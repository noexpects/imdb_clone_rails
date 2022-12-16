# frozen_string_literal: true

RSpec.describe 'Log in page' do
  describe 'Reaching login page' do
    before do
      visit new_user_session_path
    end

    it { expect(status_code).to be(200) }
  end

  describe 'Success' do
    describe 'Redirect after login works correctly' do
      let(:password) { FFaker::Lorem.characters(10) }
      let(:user) { create(:user, password: password) }

      before do
        visit new_user_session_path
        fill_in('user_email', with: user.email)
        fill_in('user_password', with: password)
        click_on('submit_btn')
      end

      it { expect(status_code).to be(200) }
      it { expect(page).to have_current_path(root_path) }
    end

    describe 'Notification message presence' do
      let(:password) { FFaker::Lorem.characters(10) }
      let(:user) { create(:user, password: password) }

      before do
        visit new_user_session_path
        fill_in('user_email', with: user.email)
        fill_in('user_password', with: password)
        click_on('submit_btn')
      end

      it { expect(page.has_css?('#notice_message')).to be true }
    end
  end

  describe 'Failure' do
    describe 'There is no redirect if incorrect data passed to form' do
      before do
        visit new_user_session_path
        click_on('submit_btn')
      end

      it { expect(status_code).to be(200) }
      it { expect(page).to have_current_path(new_user_session_path) }
    end

    describe 'Alert message presence' do
      before do
        visit new_user_session_path
        click_on('submit_btn')
      end

      it { expect(status_code).to be(200) }
      it { expect(page.has_css?('#alert_message')).to be true }
    end
  end
end
