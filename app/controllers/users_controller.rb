class UsersController < ApplicationController
  include UsersHelper

  before_action :verify_logged_in, only: [:show, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      send_welcome_email(@user)
      flash[:success] = "Account created successfully!"
      redirect_to dashboard_path
    else
      flash.now[:danger] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    redirect_to admin_dashboard_index_path if current_admin?
  end

  def edit
    if current_user.id.to_s != params[:id]
      flash[:danger] = "You can only edit your own account"
      redirect_to edit_user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def send_welcome_email(user)
    UserNotifierMailer.send_signup_email(user).deliver if user.email
  end
end
