class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new
    user.email = params[:user][:email]
    user.password = params[:user][:password]
    user.save
    redirect_to events_url
  end

  def destroy
    User.delete(params[:id])
    redirect_to events_url
  end

  def show
    @user = User.find_by(id: params[:id])
    if !@user || (@user.id != session[:user_id].to_i)
      redirect_to root_url
    end
  end

end
