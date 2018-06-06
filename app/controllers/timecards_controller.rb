class TimecardsController < ApplicationController
  def show
    init_show_edit
    
    #承認画面からの遷移：編集不可
    @disabled = true
    render "edit"
  end
  
  def edit
    init_show_edit
    
    #未申請状態以外の時：編集不可
    @disabled = (@tc.shinsei_kbn != 0)
  end

  def index
    @count = 0
    @user = User.find_by(id: session[:user_id])
    @tc_list = Timecard.where(user_id: session[:user_id])
  end
  
  def update
    @tc=Timecard.find(params[:timecard][:id])
    if @tc.update(update_tc_params)
      #申請ボタンからのSubmitなら、申請区分を未申請→申請中に変更
      if params[:btn_shinsei]
        @tc.shinsei_kbn = 1 #申請中
        @tc.save
      end
      
      flash[:success] = "更新に成功しました"
      redirect_to "#{timecards_path}/#{@tc.id}/edit"
    else
      render plain: "error" #show
    end
  end
  
  private
    def tc_params
      params.require(:timecard).permit(:shinsei_kbn)
    end
    
    def update_tc_params
      params.require(:timecard).permit( 
        timecard_detail_attributes: [:kinmu_jokyo, :start_time, :end_time, :break_time, :memo, :id])
    end
    
    def get_trgmonth_list(user_id)
      ary = []
      Timecard.where(user_id: user_id).each do |t|
        ary.push t.target_month
      end
      
      return ary
    end
    
    def init_show_edit
      @user = User.find_by(id: session[:user_id])
      @tc = Timecard.find(params[:id])
      @shinseiKbn = Generic.where(kbn: "K01")
      @jokyoKbn = Generic.where(kbn: "K02")
      @targets = get_trgmonth_list(@user.id)
    end
end
