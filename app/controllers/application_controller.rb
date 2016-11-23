class ApplicationController < ActionController::Base
  include ActionController::Serialization
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :phone, :age, :address, :username, :password,
                                                       :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :phone, :age, :address, :username, :password,
                                                              :password_confirmation])
  end
end
