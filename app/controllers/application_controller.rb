class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :info, :filter, :success, :warning
  
  def raise_not_found
    flash[:warning] = "Cette URL n'existe pas."
    redirect_to root_path
  end

  private

  def require_login
    unless current_user || devise_controller? ||  is_a?(WelcomeController)
      redirect_to welcome_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :date_of_birth, :experience, :gender, :code_club])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :date_of_birth, :experience, :gender, :code_club])
  end

end
