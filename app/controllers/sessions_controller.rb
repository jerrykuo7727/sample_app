class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
    else
      flash[:danger] = '錯誤的電子信箱或密碼' # Not quite right
      render 'new'
    end
  end

  def destroy
  end
end
