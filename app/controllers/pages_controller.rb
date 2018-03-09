# frozen_string_literal: true

class PagesController < ApplicationController
  include MetricsHelper
  def about
  end

  def contact
  end

  def frontpage
    @dreams = Dream.by_popularity_desc
  end

  def not_found
    render 'not_found', status: 404
  end
end
