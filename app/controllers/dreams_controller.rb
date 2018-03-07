# frozen_string_literal: true

class DreamsController < ApplicationResourceController
  include MetricsHelper
  before_action :authenticate_user!, except: %i[index show]
  before_action :load_metrics, only: %i[index show]

  def index
    @dreams = Dream.all
  end

  def show
    @new_dream = Dream.new
  end

  def new
    @dreams = Dream.all
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(resource_params)

    if @dream.save
      redirect_to @dream,
                  notice: 'Dream was successfully created.'
    else
      render 'new'
    end
  end

  private

  def resource_params
    params.require(:dream).permit(:caption)
  end
end
