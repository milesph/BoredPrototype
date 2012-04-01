class SessionsController < ApplicationController
	def create
		#render :text => request.env['rack.auth'].inspect
		#@andrewID = 
		#unless @auth = User.find_by_andrew_id(@andrew_id)
		#	@auth = User.create
		#	@auth = 
		#end
		#self.current_user = @auth.user
		
		#render :text => "Welcome, #{current_user.name}."
		
		if Rails.env == "production"
			auth = request.env["omniauth.auth"]
			#user = User.find_by_andrew_id(auth["uid"])
		else
			user = User.new
			user.first_name = "Eric"
			user.last_name = "Wu"
			user.andrew_id = "ewu"
		end

		#if user.nil?
			#user = User.create
			#user.andrew_id = auth["uid"]
		#else
			reset_session
			session[:user_id] = user.id
			flash[:notice] = "You have been successfully logged in"
			puts "You have been logged in as #{auth["uid"]}"
			redirect_to request.env['omniauth.origin'] || root_url(:subdomain => "my")
		#end
	end
	
	def destroy
    @current_user = nil
    reset_session

    flash[:notice] = "You have been logged out"
    redirect_to root_url(:subdomain => false)
  end
end