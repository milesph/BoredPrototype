class ApplicationController < ActionController::Base
  protect_from_forgery
  
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
    rescue_from ActionController::UnknownController, :with => :render_not_found
    rescue_from ActionController::UnknownAction, :with => :render_not_found
  
  def current_user
		@current_user ||= User.find_by_id(session[:user_id])
	end
  
	def signed_in?
		!!current_user
	end

	helper_method :current_user, :signed_in?

	def current_user=(user)
		@current_user = user
		session[:user_id] = user.id
	end
	
	def login_required
		if not signed_in?
			redirect_to sessions_url
		end
	end
	
	def render_not_found(exception)
    log_error(exception)
    render :template => "/error/404.html.erb", :status => 404
  end

  def render_error(exception)
    log_error(exception)
    render :template => "/error/500.html.erb", :status => 500
  end
	
end
