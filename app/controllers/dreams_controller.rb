# frozen_string_literal: true

class DreamsController < ApplicationController
  def index
    @dreams = Dream.all
    @dreams_count = @dreams.size
  end

  def new
    @dreams = Dream.all
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)

    if @dream.save
      redirect_to @dream,
        notice: 'Dream was successfully created.'
    else
      render 'new'
    end
  end

  private

  def dream_params
    params.require(:dream).permit(:caption)
  end
end
