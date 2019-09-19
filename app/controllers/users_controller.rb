class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)  
    if @user.save
      flash[:success] = "Вы успешно зарегистрировались"
      redirect_to @user
    else
      flash[:danger] = "Вы не зарегистрировались"
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end
  
end
