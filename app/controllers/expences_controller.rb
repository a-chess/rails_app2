class ExpencesController < ApplicationController
  include ExpencesHelper
  
  def index
    @user = User.find_by(id: session[:user_id])
    @tc_list = Timecard.where(user_id: session[:user_id])
  end
  
  def show
    @is_show = true
    @tc = Timecard.find(params[:id])
    @expences = Expence.where(timecard_id: @tc.id)
    @user = User.find_by(id: @tc.user_id)
    @days = get_days(@tc.target_month)
    @expKbn = Generic.where(kbn: "K03")
    
    render 'edit'
  end
  
  def edit
    
    @tc = Timecard.find(params[:id])
    @expences = Expence.where(timecard_id: @tc.id)
    @user = User.find_by(id: @tc.user_id)
    @days = get_days(@tc.target_month)
    @expKbn = Generic.where(kbn: "K03")
    @is_show = (@tc.keihi_shinsei_kbn != 0)
  end
  
  def create
    @tc = Timecard.find(params[:id])
    @days = get_days(@tc.target_month)
    @tc.expences.create(
      date: @days[0],
      expence_kbn: 0,
      cost: 0,
      memo: "")  
  
    redirect_to edit_expence_path(params[:id])
  end
  
  def update
    @tc=Timecard.find(params[:timecard][:id])
    if @tc.update(update_exp_params)
      #申請ボタンからのSubmitなら、申請区分を未申請→申請中に変更
      if params[:btn_shinsei]
        @tc.keihi_shinsei_kbn = 1 #申請中
        @tc.save
      end
      
      flash[:success] = "更新に成功しました"
      redirect_to edit_expence_path(id: @tc.id)
    else
      render plain: "error" #show
    end
  end
  
  def destroy
    exp = Expence.find(params[:id])
    tc = Timecard.find(exp.timecard_id)
    exp.destroy
    
    redirect_to edit_expence_path(tc.id)
  end
  
  private
    def update_exp_params
      params.require(:timecard).permit( 
        expences_attributes: [:date, :expence_kbn, :cost, :memo, :id])
    end
end
