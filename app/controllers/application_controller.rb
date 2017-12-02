class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  protected
  
    # def after_sign_in_path_for(current_user)
    #   posts_path
    # end
  
    # def after_sign_up_path_for(current_user)
    #   posts_path
    # end
end
