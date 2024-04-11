class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email], params[:password]) 
    if @user
      redirect_to root_path, success: 'ログインできましたねえ'
    else
      flash.now[:error] = 'Login failed'
      @user = User.new(name: params[:name], email: params[:email], password: params[:password])
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: 'Logged out!', status: :see_other
  end
end

