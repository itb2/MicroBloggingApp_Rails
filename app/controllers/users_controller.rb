class UsersController < ApplicationController

	def index
		#/users
		#display the users
	end

	def create
		#/users -> post request
		#create a user -add them to the database
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

		redirect '/'
	end

	def new
		#/users/new
		#show user sign up page - register
	end

	def edit
		#/users/:id/edit 
		#Go to a page where you edit users -settings
	end

	def show
		#/users/:id
		#Go to a users profile
	end

	def update
		#/users/:id -> Put/Patch request
		#actually edit the users submission to settiings
	end

	def destroy
		#/users/:id -> Delete request
		#delete/destroy a users
	end

end