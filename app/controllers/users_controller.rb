class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def gotmilk
    @user = User.find(params[:id])
    if @user.present?
      quantity = params[:quantity] if params[:quantity].present?
      @user.update_attributes(:got_milk_date => Time.now, :got_milk_quantity => quantity)
      redirect_to root_path, :notice => "Saved!"
    else
      redirect_to root_path, :warning => "Did not save!"    
    end    
  end

end
