# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  protect_from_forgery with: :exception
end
