# frozen_string_literal: true

class DreamsController < ApplicationResourceController
  include MetricsHelper
  before_action :authenticate_user!, except: %i[index show]
  before_action :load_metrics, only: %i[index show]

  def index
    load_metrics
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
      Embrace.create(dream: @dream, user: current_user)
      redirect_to @dream,
                  notice: 'Dream was successfully created.'
    else
      render 'new'
    end
  end

  def embrace
    load_resource
    if Embrace.create(dream: @dream, user: current_user)
      redirect_to @dream,
                  notice: 'Dream was successfully embraced.'
    else
      redirect_to @dream,
                  alert: 'Dream was not successfully embraced.'
    end
  end

  def disembrace
    load_resource
    if Embrace.find_by(dream: @dream, user: current_user).destroy
      redirect_to @dream,
                  notice: 'Dream was successfully disembraced.'
    else
      redirect_to @dream,
                  alert: 'Dream was not successfully embraced.'
    end
  end

  private

  def resource_params
    params.require(:dream).permit(:caption)
  end
end
