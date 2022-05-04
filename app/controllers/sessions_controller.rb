class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ログイン後にユーザー情報ページにリダイレクトします。
      # sessions_helperの　log_inメソッドで､
      # session(※ブラウザのcokies)にログイン情報(user　id)を保存することが可能
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "認証に失敗しました。"
      render :new
    end
  end
end