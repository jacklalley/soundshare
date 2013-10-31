class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create  # user sign up
    @user = User.new params[:user]
      if @user.save
        session[:user_id] = @user.id
        redirect_to tracks_path, notice: "Thank you for signing up"
      else
        render :new
      end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]

    # build css customization code
    css = "body { #{params[:font_color]} #{params[:bg_color]} }"
    params[:user][:css] = css
    
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated!'
    else
      flash.now[:alert] = 'User was NOT updated!'
      render :edit
    end
  end

  def show
    @user = User.find params[:id]
    @style = @user.css
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to users_url
  end
end