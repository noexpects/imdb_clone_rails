# frozen_string_literal: true

RSpec.describe 'User data change' do
  let(:password) { FFaker::Lorem.characters(10) }
  let(:user) { create(:user, password: password) }

  before do
    sign_in user
    visit edit_user_registration_path
    fill_in('current_password', with: password)
  end

  describe 'Changing email' do
    let(:new_email) { attributes_for(:user)[:email] }

    before do
      fill_in('user_email', with: new_email)
      click_on('submit_btn')
    end

    context 'when user did not confirm new email' do
      before do
        visit edit_user_registration_path
      end

      it { expect(status_code).to be(200) }
      it { expect(page.find_by_id('user_email').value).to eq user.email }
      it { expect(page.has_css?('#waiting_confirmation_message')).to be true }
    end

    context 'when user confirmed new email' do
      let(:token) do
        raw, enc = Devise.token_generator.generate(User, :confirmation_token)
        { raw: raw, enc: enc }
      end

      before do
        user.confirmation_token = token[:enc]
        user.confirmation_sent_at = Time.now.utc
        user.save(validate: false)
        visit user_confirmation_path(confirmation_token: token[:raw])
        visit edit_user_registration_path
      end

      it { expect(status_code).to be(200) }
      it { expect(page.find_by_id('user_email').value).to eq new_email }
      it { expect(page.has_css?('#waiting_confirmation_message')).to be false }
    end
  end

  describe 'Changing password' do
    let(:new_password) { attributes_for(:user)[:password] }

    describe 'Success' do
      before do
        fill_in('user_password', with: new_password)
        fill_in('user_password_confirmation', with: new_password)
        click_on('submit_btn')
      end

      it { expect(status_code).to be(200) }
      it { expect(page).to have_current_path(root_path) }
      it { expect(page.has_css?('#notice_message')).to be true }
    end

    describe 'Failure' do
      let(:new_password) { attributes_for(:user)[:password] }

      before do
        fill_in('current_password', with: attributes_for(:user)[:password])
        fill_in('user_password', with: new_password)
        fill_in('user_password_confirmation', with: new_password)
        click_on('submit_btn')
      end

      it { expect(status_code).to be(200) }
      it { expect(page).to have_current_path(user_registration_path) }
      it { expect(page.has_css?('#error_explanation')).to be true }
    end
  end

  describe 'Deleting account', driver: :chrome do
    before do
      click_on('deleteAccBtn')
    end

    it { expect(page).to have_current_path(root_path) }
    it { expect(page.has_css?('#notice_message')).to be true }
    it { expect(User.count).to eq(0) }
  end
end
