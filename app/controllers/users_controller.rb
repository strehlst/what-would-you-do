# frozen_string_literal: true

class UsersController < RestrictedAccessController
  include MetricsHelper
  include UploadHelper
  before_action :authenticate_user!, except: %i[show]
  load_and_authorize_resource

  def show
    load_metrics
    @page_title = @user.public_name + ' ' + t('main.partials.would') + '...'
    @dreams = Embrace.includes(:dream).all.where(user_id: @user.id)
      .map { |embrace| Dream.find(embrace.dream_id) }
  end

  def edit
  end

  def update
    @user.attributes = resource_params
    if @user.avatar_image_file
      update_avatar
    elsif @user.delete_avatar_path
      delete_avatar
    else
      update_user
    end
  end

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

  def update_user
    if @user.save
      redirect_to edit_user_path(@user), notice: t('users.update.success')
    else
      redirect_to edit_user_path(@user), alert: @user.errors
    end
  end

  def update_avatar
    old_avatar_path = @user.avatar_path
    @user.update_avatar
    if @user.changed? && @user.save
      delete_user_avatar_file(old_avatar_path) if old_avatar_path
      redirect_to edit_user_path(@user), notice: t('users.update.success')
    else
      redirect_to edit_user_path(@user), alert: @user.errors
    end
  end

  def delete_avatar
    old_avatar_path = @user.avatar_path
    @user.avatar_path = nil
    if @user.changed? && @user.save
      delete_user_avatar_file(old_avatar_path) if old_avatar_path
      redirect_to edit_user_path(@user), notice: t('users.update.success')
    else
      redirect_to edit_user_path(@user), alert: @user.errors
    end
  end

  def resource_params
    params.require(:user).permit(:public_name, :email, :avatar_image_file, :delete_avatar_path)
  end
end
