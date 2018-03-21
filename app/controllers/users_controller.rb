# frozen_string_literal: true

class UsersController < ApplicationResourceController
  include MetricsHelper
  before_action :authenticate_user!, except: %i[show]

  def show
  end

  #   def edit
  #   end
  #
  #   def update
  #     if @user.update(resource_params)
  #       redirect_to @user, notice: 'User was successfully updated.'
  #     else
  #       render :edit
  #     end
  #   end
  #
  #   # DELETE /users/1
  #   def destroy
  #     @user.destroy
  #     redirect_to users_url, notice: 'User was successfully destroyed.'
  #   end

  def dreams
    @new_dream = Dream.new
    @dreams = Embrace.includes(:dream).all.where(user_id: current_user.id)
      .map { |embrace| Dream.find(embrace.dream_id) }
  end

  private

  def resource_params
    params.require(:user).permit(:public_name, :email)
  end
end
