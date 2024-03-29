# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout 'visitor'
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
   def create
    if params[:user][:code_club] != "tcstjulien74"
      flash[:alert] = "Votre code club/numéro de licence n'est pas valide"
      redirect_to new_user_registration_path
      return
    end
  
    super
   end

  # GET /resource/edit
  def edit
    render layout: 'layouts/user_actions'
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def after_update_path_for(resource)
    edit_user_registration_path
  end

    # The path used after sign up.
  def after_sign_up_path_for(resource)
    flash[:notice] = "Bienvenue au TC St Julien, #{current_user.first_name.capitalize} ! Tu peux modifier tes préférences de jeu par ici."
    edit_user_path(current_user.id)
  end

  # If you have extra params to permit, append them to the sanitizer.
  

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute, :code_club])
  # end



  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
