class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include PublicActivity::StoreController
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :set_latest_activities

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:full_name, :admin, :category, :avatar]
    devise_parameter_sanitizer.for(:account_update) << [:full_name, :admin, :category, :avatar]
  end

  def set_latest_activities
    if user_signed_in?
      @latest_activities = PublicActivity::Activity.order("created_at desc").where(owner_id: User.all.ids - [current_user.id], owner_type: 'User').take(3)
    end
  end
end
