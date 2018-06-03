class TimecardMasterMenteController < ApplicationController
  def index
    @tc_month_list = TimecardIndece.all
  end
  
  #index追加
  def create
    base_month = TimecardIndece.maximum(:target_month)
    create_month = (base_month.to_i + 1).to_s
    
    if create_month[-2,2].to_i > 12
      create_month = (create_month[0,4].to_i + 1).to_s + "01"
    end
    
    tc = TimecardIndece.new
    tc.target_month = create_month
    if tc.save
      flash[:success] = "インデックスを追加しました"
      redirect_to tcmente_path
    else
      flash[:error] = TimecardIndece.errors.messages
      redirect_to tcmente_path
    end
  end
  
  #カレンダー作成
  def create_cal
    target_month = params[:target_month]
    
    begin
      
      date_s = Date.new(target_month[0,4].to_i,target_month[4,2].to_i,1)
      date_e = Date.new(target_month[0,4].to_i,target_month[4,2].to_i,-1)
      
      Timecard.transaction do
          User.all.each do |user|
            
            if !Timecard.exists?(user_id: user.id, target_month: target_month)
              
              #TC登録
              tc = Timecard.new
              tc.user_id = user.id
              tc.target_month = target_month
              tc.shinsei_kbn = 0
              tc.save!
              
              #TC詳細登録
              (date_s..date_e).each do |date|
                
                case date.wday
                when 0,6
                  jokyo = 0
                else
                  jokyo = 1
                end
                
                tc.timecard_detail.create(
                  target_date: date,
                  kinmu_jokyo: jokyo,
                  start_time: "09:00:00",
                  end_time: "18:00:00",
                  break_time: 60)  
              end
              
              #保存
              
            end          
          end
      end
    rescue => e
      flash[:error] = e.message
      redirect_to tcmente_path
    end      
  end
end
