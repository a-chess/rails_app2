class SessionsController < ApplicationController
  skip_before_action :user_logged_in?
  
  def new
    #ログイン済みならhomeへ誘導
    if logged_in?
      redirect_to home_url
    end
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to home_url
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
