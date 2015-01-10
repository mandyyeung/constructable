class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:full_name, :admin, :category, :avatar]
    devise_parameter_sanitizer.for(:account_update) << [:full_name, :admin, :category, :avatar]
  end
end
