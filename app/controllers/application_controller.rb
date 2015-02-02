class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  private
    def current_user
      begin
        if Rails.env.development?
          @current_user = User.find_by(:name => "Neil Williams")
          if @current_user.blank?
            @current_user = User.create(:name => "Neil Williams")
          end
        else
          @current_user ||= User.find(session[:user_id]) if session[:user_id]
        end
      rescue Exception => e
        nil
      end
      return @current_user
    end

    def user_signed_in?
      return true if current_user
    end

    def correct_user?
      @user = User.find(params[:id])
      unless current_user == @user
        redirect_to root_url, :alert => "Access denied."
      end
    end

    def authenticate_user!
      if !current_user
        redirect_to root_url, :alert => 'You need to sign in for access to this page.'
      end
    end

end
