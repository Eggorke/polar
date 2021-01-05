class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :organisation_id])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :organisation_id])
  end

  private

  def redirect_if_not_logged_in
    unless user_signed_in?
      flash[:alert] = 'Залогинься сперва'
      redirect_to root_path
    end
  end

end
