# frozen_string_literal: true

class RestrictedAccessController < ApplicationResourceController
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end
end
