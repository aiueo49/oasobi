class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:name], params[:email], params[:password]) 
    if @user.present? && @user.save
      redirect_to root_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!', status: :see_other
  end
end

