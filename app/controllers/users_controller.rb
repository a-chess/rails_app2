class UsersController < ApplicationController
  
  def index
    
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    @edit_user = User.find_by(id: session[:user_id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params) 
    
    if @user.save
      @user.save
      flash[:success] = "新規アカウントを作成しました"
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find_by(params.require(:user).permit(:id))
    
    if @user.update_columns(name: params[:user][:name], email: params[:user][:email])
      flash[:success] = "社員情報を更新しました"
      render 'edit'
    else
      render 'edit'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
end
