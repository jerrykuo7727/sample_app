class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "樣品App帳號驗證信"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "樣品App密碼重置信"
  end
end
