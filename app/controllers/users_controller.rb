class UsersController < ApplicationController
  
  def show #追加
    @user = User.find(params[:id])
    #render "show" いちいち記述しないがRailsで処理してくれているもの
  end
  
  def new
    @user = User.new
    # render "new" いちいち記述しないがRailsで処理してくれているもの
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
