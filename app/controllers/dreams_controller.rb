# frozen_string_literal: true

class DreamsController < ApplicationController
  def index
    @dreams = Dream.all
    @dreams_count = @dreams.size
  end

  def show
  end
end
