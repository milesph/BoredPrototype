class ApplicationController < ActionController::Base
  protect_from_forgery
  include Exceptions
    #rescue_from Exception, :with => :render_error
    #rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    #rescue_from ActionController::RoutingError, :with => :render_not_found
    #rescue_from ActionController::UnknownController, :with => :render_not_found
    #rescue_from ActionController::UnknownAction, :with => :render_not_found
	rescue_from Exceptions::AuthenticationException, :with => :render_not_authorized
  
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
    render :template => "/error/404.html.erb", :status => 404
  end

  def render_error(exception)
    #log_error(exception)
    render :template => "/error/500.html.erb", :status => 500
  end
  
  def render_not_authorized(exception)
	redirect_to root_url, notice: 'Your andrew ID has not been approved for creating events. You should contact the moderator for access.'
  end
end
