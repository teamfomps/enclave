class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout 'unauthenticated'
  before_action :configure_permitted_devise_parameters, if: :devise_controller?

  # # TODO: Raise a 404 like a grownup
  # rescue_from ActiveRecord::RecordNotFound do
  #   flash[:warning] = 'Resource not found.'
  #   redirect_back_or root_path
  # end

  protected

  def configure_permitted_devise_parameters
    attributes = [:first_name, :last_name, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
