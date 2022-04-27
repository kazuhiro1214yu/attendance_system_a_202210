module ApplicationHelper
  
# 各viewを表示したときの｢タイトル｣をつけるためのメソッド｡
# full_titleメソッドを､application.htmlファイルの<titleタグ>の中に入れることで､
# 各viewファイルに記述した｢provide｣メソッドが反映して各viewファイルがシンプルな記述で収まる｡
  def full_title(page_name = "")
    base_title = "AttendanceApp"
    if page_name.empty? # 引数を受け取っているか判定(引数　=　page_name)
      base_title
    else
      page_name + "|" + base_title
    end 
  end 
  
end
