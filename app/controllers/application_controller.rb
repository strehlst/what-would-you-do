# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  protect_from_forgery with: :exception

  private

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
