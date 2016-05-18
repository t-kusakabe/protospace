class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :authenticate_user_conditions

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :password, :profile, :position, :occupation, :avatar)
    devise_parameter_sanitizer.for(:account_update).push(:name, :password, :profile, :position, :occupation, :avatar)
  end

  def authenticate_user_conditions
    params[:controller] == 'prototypes' && params[:action] == 'index'
  end
end
