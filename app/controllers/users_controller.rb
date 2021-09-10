class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      flash[:success] = "情報を更新しました"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = User.find(params[:id])
    if @user.update(is_deleted: false)
      sign_out current_user
    end
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:is_deleted, :name, :email, :director, :telephon_number)
  end

end
