# frozen_string_literal: true

RSpec.describe 'Reset password page' do
  let(:token) do
    raw, enc = Devise.token_generator.generate(User, :reset_password_token)
    { raw: raw, enc: enc }
  end

  let(:password) { attributes_for(:user)[:password] }

  before do
    user = create(:user)
    user.reset_password_token = token[:enc]
    user.reset_password_sent_at = Time.now.utc
    user.save(validate: false)
    visit edit_user_password_path(reset_password_token: token[:raw])
  end

  describe 'Success' do
    describe 'Redirect works correctly' do
      before do
        fill_in('user_password', with: password)
        fill_in('user_password_confirmation', with: password)
        click_on('submit_btn')
      end

      it { expect(status_code).to be(200) }
      it { expect(page).to have_current_path(root_path) }
    end

    describe 'Notice message present' do
      before do
        fill_in('user_password', with: password)
        fill_in('user_password_confirmation', with: password)
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

    describe 'Errors present' do
      before do
        click_on('submit_btn')
      end

      it { expect(page.has_css?('#error_explanation')).to be true }
    end
  end
end
