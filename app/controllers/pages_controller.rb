# frozen_string_literal: true

class PagesController < ApplicationController
  include MetricsHelper
  def about
  end

  def contact
  end

  def frontpage
    @dreams = Dream.all.limit(5)
  end

  def not_found
    render 'not_found', status: 404
  end
end
