# frozen_string_literal: true

class SurveysController < ApplicationResourceController
  def index
    @surveys = Survey.all
  end

  def show
  end
end
