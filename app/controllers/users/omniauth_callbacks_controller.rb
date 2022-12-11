# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      user = upsert_from_google
      if user.present?
        sign_in_and_redirect user, event: :authentication
      else
        redirect_to new_user_session_path
      end
    end

    def failure
      redirect_to root_path
    end

    private

    def upsert_from_google
      password = Devise.friendly_token[0, 20]
      User.find_or_create_by(uid: params[:uid]) do |user|
        user.provider = params[:provider]
        user.email = params[:email]
        user.password = password
        user.password_confirmation = password
      end
    end

    def params
      {
        uid: auth.uid,
        email: auth.info.email,
        provider: auth.provider
      }
    end

    def auth
      request.env['omniauth.auth']
    end
  end
end
