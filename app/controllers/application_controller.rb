class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_search
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


  protected
  
    def after_sign_in_path_for(current_user)
      posts_path
    end
  
    def after_sign_up_path_for(current_user)
      posts_path
    end

  private
    
    def record_not_found
      flash[:alert] = "Record not Found"
      redirect_to root_url
    end

    def set_search
      @q = User.ransack(params[:q])
    end
end
