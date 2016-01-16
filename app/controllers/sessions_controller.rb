class SessionsController < ApplicationController
	
	def new
		
	end
	
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			flash[:success] = "You have successfully logged in"
			redirect_to user_path(user)
			session[:user_id] = user.id	
		else
			flash.now[:danger] = "Invalid email or password"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out successfully"
		redirect_to root_path	
	end

end
