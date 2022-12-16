# frozen_string_literal: true

RSpec.describe Users::OmniauthCallbacksController do
  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'Google' do
    let(:auth_hash) do
      Struct.new(:provider, :uid, :info).new('google_oauth2', rand.to_s[1..5],
                                             Struct.new(:email).new(attributes_for(:user)[:email]))
    end

    context 'with new user' do
      it 'creates an entry' do
        request.env['omniauth.auth'] = auth_hash
        expect { get :google_oauth2 }.to change(User, :count).from(0).to(1)
      end
    end

    context 'with existing client' do
      let(:user) { create(:user, uid: rand.to_s[1..5]) }

      before { auth_hash.uid = user.uid }

      it 'do not creates an entry' do
        request.env['omniauth.auth'] = auth_hash
        expect { get :google_oauth2 }.not_to change(User, :count)
      end
    end
  end
end
