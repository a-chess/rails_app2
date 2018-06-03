module TimecardsHelper
  #日付（曜日）の形式に変換
  def cnv_date_fmt(date)
    return "#{date.day}(#{get_wday_jp(date.wday)})"
  end
  
  #曜日（日本語名）を取得
  def get_wday_jp(wday)
    ar = %w{日 月 火 水 木 金 土}
    return ar[wday]
  end
  
  #カレンダーの日別カラー取得　※そのうち祝日マスタを見るようにしたい
  def get_wday_color(wday)
    ret=""
    case wday
    when 0,6 then   #土日はピンク
      ret="pink"
    end
    
    return ret
  end
end
