class UsersController < ApplicationController

  def new
    @user = User.new
    @guest = Guest.new
  end

  def create
    user = User.new
    user.email = params[:user][:email]
    user.password = params[:user][:password]
    user.save

    guest = Guest.new
    guest.user_id = user.id
    guest.email = params[:user][:email]
    guest.phone = params[:guest][:phone]
    guest.first_name = params[:guest][:first_name]
    guest.last_name = params[:guest][:last_name]
    guest.save

    user.guest_id = guest.id
    user.save

    redirect_to login_path
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
