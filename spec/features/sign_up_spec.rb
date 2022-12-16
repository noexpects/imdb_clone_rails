# frozen_string_literal: true

RSpec.describe 'Sign up page' do
  describe 'Reaching sign up page' do
    before do
      visit new_user_registration_path
    end

    it { expect(status_code).to be(200) }
  end

  describe 'Success' do
    describe 'Redirect after sign up works correctly' do
      let(:attributes) { attributes_for(:user) }

      before do
        visit new_user_registration_path
        fill_in('user_email', with: attributes[:email])
        fill_in('user_password', with: attributes[:password])
        fill_in('user_password_confirmation', with: attributes[:password])
        click_on('submit_btn')
      end

      it { expect(status_code).to be(200) }
      it { expect(page).to have_current_path(new_user_session_path) }
    end

    describe 'Notification message presence' do
      let(:attributes) { attributes_for(:user) }

      before do
        visit new_user_registration_path
        fill_in('user_email', with: attributes[:email])
        fill_in('user_password', with: attributes[:password])
        fill_in('user_password_confirmation', with: attributes[:password])
        click_on('submit_btn')
      end

      it { expect(status_code).to be(200) }
      it { expect(page.has_css?('#notice_message')).to be true }
    end
  end

  describe 'Failure' do
    describe 'There is no home page redirect if incorrect data passed to form' do
      before do
        visit new_user_registration_path
        click_on('submit_btn')
      end

      it { expect(status_code).to be(200) }
      it { expect(page).to have_current_path(user_registration_path) }
    end

    describe 'Error explanation presence' do
      before do
        visit new_user_registration_path
        click_on('submit_btn')
      end

      it { expect(status_code).to be(200) }
      it { expect(page.has_css?('#error_explanation')).to be true }
    end
  end
end
