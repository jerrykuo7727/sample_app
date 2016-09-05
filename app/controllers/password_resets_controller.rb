class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "密碼重置信已發送至電子信箱"
      redirect_to root_url
    else
      flash.now[:danger] = "此電子信箱尚未註冊"
      render 'new'
    end
  end

  def edit
  end
end
