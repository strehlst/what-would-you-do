# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(allowed_user_params)
  end

  def account_update_params
    params.require(:user).permit(allowed_user_params)
  end

  def allowed_user_params
    %i[public_name email password password_confirmation current_password]
  end
end
