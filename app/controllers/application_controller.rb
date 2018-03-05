# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :load_resource, only: [:show]
  protect_from_forgery with: :exception

  private

  def load_resource
    @resource = controller_name.classify.constantize.find(params[:id])
  end
end
