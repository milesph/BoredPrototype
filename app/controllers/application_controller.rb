class ApplicationController < ActionController::Base
  protect_from_forgery
  include Exceptions
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
    rescue_from ActionController::UnknownController, :with => :render_not_found
    rescue_from ActionController::UnknownAction, :with => :render_not_found
	rescue_from Exceptions::AuthenticationException, :with => :render_not_authorized
	rescue_from Exceptions::AccessDeniedException, :with => :render_access_denied
  
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
    #log_error(exception)
    #render :template => "/error/404.html.erb", :status => 404
	flash[:notice] = "Whoops! Something bad happened."
	redirect_to root_url
  end

  def render_error(exception)
    #log_error(exception)
    #nder :template => "/error/500.html.erb", :status => 500
	flash[:notice] = "Whoops! Something unexpected happened. We are looking into it."
	redirect_to root_url
  end
  
  def render_not_authorized(exception)
	flash[:notice] = "Either you are not logged in or your Andrew ID has not been approved for creating events."
	redirect_to root_url
  end
  
  def render_access_denied(exception)
	flash[:notice] = "Access denied. Maybe you're not a member of this organization?"
	redirect_to root_url
  end
 
end
