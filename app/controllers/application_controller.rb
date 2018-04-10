# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :force_proper_host_name if Rails.env.production? && ENV['HOST_NAME']
  before_action :set_locale

  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || user_dreams_path
  end

  def after_sign_out_path_for(*)
    dreams_path
  end

  private

  def force_proper_host_name
    redirect_to 'http://' + ENV['HOST_NAME'] if request.host != ENV['HOST_NAME']
  end

  def set_locale
    requested_locale = ENV['APPLICATION_LOCALE']

    unless requested_locale && I18n.available_locales.include?(requested_locale.to_sym)
      requested_locale = I18n.default_locale
    end

    session[:locale] = requested_locale
    I18n.locale      = requested_locale
    @application_locale = requested_locale.to_s.split('-')[0]
  end
end
