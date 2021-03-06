class UsersController < ApplicationController
  before_action :check_if_logged_in, :only => [:edit]
  before_action :check_if_admin, :only => [:index]

  def index
    @users = User.all.sort_by { |u| [u.name.downcase] }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = @current_user
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
