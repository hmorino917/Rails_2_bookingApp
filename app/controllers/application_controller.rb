class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_parameters, if: :devise_controller?

  add_flash_types :success, :info, :warning, :danger

  def after_sign_in_path_for(resource)
    users_index_path 
  end

  def after_sign_out_path_for(resource)
    new_user_session_path 
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

  def configure_account_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :profile_image])
  end
end