class ApplicationController < ActionController::Base
  require 'will_paginate/array'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  #before_action :require_login
 
  private
 
  def require_login
    unless logged_in?
      # flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
end
