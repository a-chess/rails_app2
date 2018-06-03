class ApprovalController < ApplicationController
  def index
    @tc_index = TimecardIndece.all
    @users = User.all
    @target = params[:target]
    if @target.nil?
      @target = TimecardIndece.last.target_month
    end
  end
  
  def update
    tc = Timecard.find(params[:id])
    tc.shinsei_kbn = 2
    if tc.save
      flash[:success] = "承認を行いました。"
    else
      flash[:error] = "承認に失敗しました"
    end
    redirect_to approval_path
  end
end
