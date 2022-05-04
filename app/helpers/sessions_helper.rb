module SessionsHelper

  # 引数に渡されたユーザーオブジェクトでログインします。
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id) #ブラウザのcokiesに保存しているsessionのuser.idだけ削除してもだめ
    @current_user = nil #使い回しやすいようにcurrent_userメソッドで保存した@current_userも削除が必要
  end 

  # 現在ログイン中のユーザーがいる場合オブジェクトを返します。
  # @current_userがviewやcontrollerで活用できるようにするためのメソッド
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  # 現在ログイン中のユーザーがいればtrue、そうでなければfalseを返します。
  def logged_in?
    !current_user.nil?
  end
end