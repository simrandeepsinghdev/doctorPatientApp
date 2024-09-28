class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      
      if user.receptionist?
        redirect_to receptionist_dashboard_path
      elsif user.doctor?
        redirect_to doctor_dashboard_path
      end
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end
end
