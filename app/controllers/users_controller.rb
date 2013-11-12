class UsersController < ApplicationController

  before_filter :set_user, :except => [:new, :create]

  def show
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to sessions_create_path(user_params)
  	else
  		render "new"
  	end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: "Update saved"
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to new_session_path
  end

  private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :username, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
