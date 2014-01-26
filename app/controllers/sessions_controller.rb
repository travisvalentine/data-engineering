class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
      session[:user_id] = user.id
      flash[:alert] = t(:"session.logged_in")
      redirect_to new_upload_path
    else
      flash[:alert] = t(:"session.invalid_login")
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    cookies.delete(:auth_token)
    flash[:alert] = t(:"session.logged_out")
    redirect_to new_session_path
  end
end