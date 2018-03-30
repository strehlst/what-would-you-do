# frozen_string_literal: true

class RestrictedAccessController < ApplicationResourceController
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to dreams_path, alert: exception.message
  end
end
