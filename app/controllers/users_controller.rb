class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user #新規登録して保存成功後､ログインも同時に行います(sessionにuser.idを保存すること)
      flash[:success] = "新規作成に成功しました｡"
      redirect_to @user
      # 保存に成功した場合は、ここに記述した処理が実行されます。
    else
      render :new
    end
  end
  
  def edit
   @user = User.find(params[:id])
  end 

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end