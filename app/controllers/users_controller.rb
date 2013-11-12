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
  		session[:user_id] = @user.id
      redirect_to products_path, notice: "Account created! Welcome!"
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
    session[:user_id] = nil
    @user.destroy
    redirect_to products_path, notice: "Account permanently deleted. We're sorry to see you go!"
  end

  private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :username, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
