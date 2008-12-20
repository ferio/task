class ApplicationController < ActionController::Base
  helper :all
  before_filter :find_user
  
  protected
  
  def find_user
    @current_user= User.find_by_id session[:user_id]
  end
end
