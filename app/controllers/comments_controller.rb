class CommentsController < ApplicationController

	def index
		#/users
		#display the users
	end

	def create
		#/comments -> post request
		#create a user -add them to the database
		Comment.create(
			user: User.where(id: session[:user_id]).first,
			post: Post.where(id: params[:pid]).first,
			text: params[:comment],
			posted_at: DateTime.now

			)
		redirect_to :back
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
		@comment = Comment.where(id: params[:id]).first
		if @comment.user_id == session[:user_id]
			Comment.delete(params[:id])
			redirect_to :back
		else
			flash[:notice] = "You cannot delete another user's comment!"
			redirect_to :back
		end
	end

end