# frozen_string_literal: true

class ApplicationResourceController < ApplicationController
  before_action :load_resource, only: %i[show edit update destroy]

  private

  def load_resource
    class_name = controller_name.classify
    instance_variable_set("@#{class_name.to_str.downcase}", class_name.constantize.find(params[:id]))
  rescue ActiveRecord::RecordNotFound => error
    logger.warn(error.to_s)
    redirect_to pages_not_found_path
  end
end
