# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def destroy
      super do
        # Turbo requires redirects be :see_other (303); so override Devise default (302)
        return redirect_to after_sign_out_path_for(resource_name), status: :see_other, notice: I18n.t('devise.sessions.signed_out')
      end
    end

    def after_sign_out_path_for(_resource_or_scope)
      new_user_session_path
    end

    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || root_path
    end
  end
end
