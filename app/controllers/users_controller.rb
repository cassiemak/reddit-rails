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
    @user.update_attributes(user_params)
    redirect_to :back
  end


  private 

    def user_params
      params.require(:user).permit(:id, :avatar)
    end
end
