class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :authorize

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def authorize
    redirect_to login_path unless current_user
  end
end
