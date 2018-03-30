# frozen_string_literal: true

class UsersController < RestrictedAccessController
  include MetricsHelper
  include UploadHelper
  before_action :authenticate_user!, except: %i[show]
  before_action :load_resource, only: %i[update_avatar]
  load_and_authorize_resource

  def show
  end

  def edit
  end

  def update
    @user.attributes = resource_params
    old_avatar_path = nil
    if @user.avatar_image_file
      old_avatar_path = @user.avatar_path
      @user.update_avatar
    elsif @user.delete_avatar_path
      old_avatar_path = @user.avatar_path
      @user.avatar_path = nil
    end
    if @user.save
      # TODO: Fail silently as this is not a crucial action
      delete_user_avatar_file(old_avatar_path) if old_avatar_path
      redirect_to edit_user_path(@user), notice: 'Yay!'
    else
      redirect_to edit_user_path(@user), errors: @user.errors
    end
  end

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
    params.require(:user).permit(:public_name, :email, :avatar_image_file, :delete_avatar_path)
  end
end
