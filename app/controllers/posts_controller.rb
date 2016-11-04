class PostsController < ApplicationController

	def index
		#/users
		#display the users
	end

	def create
		#/posts -> post request
		#create a post -add them to the database
		@user = User.where(id: session[:user_id]).first
		@p = Post.new(
			user: @user,
			text: params[:post],
			title: params[:ptitle],
			posted_at: DateTime.now

	    )
	    if !@p.save
	    	flash[:notice] = "Invalid Post: You must include all required fields and be a registered user!"
	   	end
		
		redirect_to :back
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
		#/posts/:id
		#Go to a post

		@post = Post.where(id: params[:id]).first
		if @post == nil
			redirect_to '/home/feed'
		else
			@author = User.where(id: @post.user_id).first
		end
	end

	def update
		#/users/:id -> Put/Patch request
		#actually edit the users submission to settiings
	end

	def destroy
		#/post/:id -> Delete request
		#delete/destroy a post
		@post = Post.where(id: params[:id]).first
		if @post.user_id == session[:user_id]
			Post.delete(params[:id])
			redirect_to :back
		else
			flash[:notice] = "You cannot delete another user's post!"
			redirect_to :back
		end
	end

end