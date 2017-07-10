class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs_sign_up = [:username, :email, :password, :password_confirmation, :phone_number , :remember_me]
    added_attrs_account_update = [:username, :email, :password ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs_sign_up
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs_account_update
  end
end
