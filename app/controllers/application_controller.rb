class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      flash[:alert] = 'You must be logged in to access this section'
      redirect_to login_path
    end
  end

  def require_receptionist
    unless current_user.receptionist?
      flash[:alert] = 'Access denied'
      redirect_to root_path
    end
  end

  def require_doctor
    unless current_user.doctor?
      flash[:alert] = 'Access denied'
      redirect_to root_path
    end
  end
end
