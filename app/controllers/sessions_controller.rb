class SessionsController < ApplicationController
  def new
  end

  def create
  	#check username for existing user
  	@user = User.find_by(username: params[:username] )
  	#if user exists check that password matches
  	if @user
  		if @user.password == params[:password]
  			#if match set session to user_id
  			session[:user_id] = @user.id
  			flash[:notice] = "You have been signed in."
  			redirect_to users_path
  		#if no match flash then reroute to login
  		else
  			flash[:alert] = "Password does not match"
  			redirect_to login_path
  		end
  	#if no matching user then flash and reroute to loing 
  	else
  		flash[:alert] = "Username does not exist."
  		redirect_to login_path
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "You have been logged out."
  	redirect_to root_path
  end

	
end
