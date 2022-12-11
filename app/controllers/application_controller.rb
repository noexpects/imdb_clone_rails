# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  helper_method :categories
  before_action :turbo_frame_request_variant

  def categories
    @categories ||= Category.all
  end

  def after_sign_in_path_for(_resource)
    root_path
  end

  private

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end
end
