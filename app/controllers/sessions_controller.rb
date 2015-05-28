class SessionsController < ApplicationController

  before_action :boot_if_logged_in, except: :destroy
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "You've been signed in"
    else
      @user.errors[:base] = "Bad username or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have been successfully signed out!"
  end

  private
  def boot_if_logged_in
    redirect_to root_path if logged_in?
  end

end
