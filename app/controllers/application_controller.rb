class ApplicationController < ActionController::Base
  before_action :require_login
  
  private

  def require_login
    unless current_user || devise_controller? ||  is_a?(WelcomeController)
      redirect_to welcome_path
    end
  end
end
