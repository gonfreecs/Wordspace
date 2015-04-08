# ApplicationController
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Added To Fix Problems with can can gem
  before_action do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  protected

  # fields for signing up
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :password, :is_female, :is_sponsor,
               :firstname, :lastname)
    end
    #mohab
    #7.4.2015
    # add avatar ,email password field to account_update
    #add budget
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username, :email, :password,
               :password_confirmation, :current_password, :avatar,
               :avatar_cache , :budget)
    end
  end
end
