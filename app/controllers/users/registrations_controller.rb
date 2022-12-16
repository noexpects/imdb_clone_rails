# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def after_inactive_sign_up_path_for(_resource_or_scope)
      new_user_session_path
    end
  end
end
