class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.present?
      user_params[:got_milk_date] = Time.now
      if @user.update_attributes(user_params)
        redirect_to root_path, :notice => "Saved!"
      else
        render "visitors/index"
      end
    else
      redirect_to root_path, :warning => "Did not save!"    
    end
  end

  def user_params
    params.require(:user).permit!
  end

end
