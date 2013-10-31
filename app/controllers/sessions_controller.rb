class SessionsController < ApplicationController
  def new
  end

  def create  # user log in
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      if user.is_first_login
        user.is_first_login = false
        user.save
        redirect_to edit_user_path(user)
      else
        redirect_to tracks_path, notice: "Logged In !"
      end
    else
      flash.now.alert = "Invalid login credentials"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "you've been logged out"
  end
end