module ExpencesHelper
  
  #対象月（YYYYMM)を元に月内の日付の配列を取得
  def get_days(target_month)
    days = Array.new
    date_s = Date.new(target_month[0,4].to_i,target_month[4,2].to_i,1)
    date_e = Date.new(target_month[0,4].to_i,target_month[4,2].to_i,-1)
    
    (date_s..date_e).each do |d|
      days.push(d)
    end
    
    return days
  end
end
