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

			params[:joined_at]= DateTime.now
			@user = User.new(user_params)
			@user.save
			redirect_to '/'
		else
			flash[:alert] = "A user already exists with that email!"
			redirect_to :back
		end
		
	end

	def new
		#/users/new
		#show user sign up page - register
		@user = User.new
	end

	def edit
		@user = User.where(id: session[:user_id]).first
		#/users/:id/edit 
		#Go to a page where you edit users -settings
	end

	def editing
		User.update(
			session[:user_id],
			user_params
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

	private

	def user_params
	    params.require(:user).permit(:email, :password, :fname, :lname, :location, :bio, :birthday)
    end
end