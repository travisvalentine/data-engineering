class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= lookup_user
  end
  helper_method :current_user

  def lookup_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def authenticate
    logged_in? ? true : access_denied
  end

  def logged_in?
    current_user.is_a? User
  end
  helper_method :logged_in?

  def access_denied
    redirect_to new_session_path, notice: t(:"session.login_prompt") and return false
  end
end
