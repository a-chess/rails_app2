class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :user_logged_in?

  def user_logged_in?
    if !logged_in?
      redirect_to login_url
    end
  end
  
end
