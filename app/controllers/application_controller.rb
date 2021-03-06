require 'tmdb/tmdb'

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :password])
  end

  def default_url_options
    { host: ENV["HOST"] || "www.moviematchnow.com" }
  end

  # def user_coordinates
  #   cookies[:gps].present ? cookies[:gps].split('|') : []
  # end
end
