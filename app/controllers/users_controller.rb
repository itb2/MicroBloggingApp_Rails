class UsersController < ApplicationController

	def index
		#/users
		#display the users
	end


	def create
		#/users -> post request
		#create a user -add them to the database
		@thingy = User.where(email: params[:email]).first
		if @thingy == nil
			User.create(
				email: params[:email],
				password: params[:password],
				fname: params[:fname],
				lname: params[:lname],
				location: params[:location],
				bio: params[:bio],
				birthday: params[:birthday].to_s,
				joined_at: DateTime.now
			)
			redirect_to '/'
		else
			flash[:alert] = "A user already exists with that email!"
			redirect_to :back
		end
		
	end

	def new
		#/users/new
		#show user sign up page - register
	end

	def edit
		@user = User.where(id: session[:user_id]).first
		#/users/:id/edit 
		#Go to a page where you edit users -settings
	end

	def editing
		User.update(
			session[:user_id],
			email: params[:email],
            password: params[:password],
            fname: params[:fname],
            lname: params[:lname],
           	location: params[:location],
            bio: params[:bio],
            birthday: params[:birthday],
			)
		redirect_to '/home/feed'
	end


	def show
		@user1 = User.where(id: params[:id]).first
		#/users/:id
		#Go to a users profile
	end


	def destroy
		#/users/:id -> Delete request
		#delete/destroy a users
		User.delete(params[:id])
		redirect_to '/'
	end
end