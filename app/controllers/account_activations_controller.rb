class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update_attribute(:activated,    true)
      user.update_attribute(:activated_at, Time.zone.now)
      log_in user
      flash[:success] = "帳號驗證成功！"
      redirect_to user
    else
      flash[:danger] = "無效的驗證連結"
      redirect_to root_url
    end
  end
end
