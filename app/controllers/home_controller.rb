class HomeController < ApplicationController
  def index
  end
  def login
  	 @user1 = User.where(email: params[:email]).first  
     if @user1 == nil
        flash[:alert] = "We have no record of a user with those credentials!"
        redirect_to :back
	   elsif @user1.password == params[:password] 
	     session[:user_id] = @user1.id
	     puts session[:user_id]
	 	   redirect_to '/home/feed'
	   else
	     flash[:alert] = "Password incorrect!" 
       redirect_to :back
	   end
  end
  def logout
    session[:user_id] = nil
    redirect_to '/'

  end
  def feed
  	@user = User.where(id: session[:user_id]).first
  	puts '**********************************'
  	puts @user
  	puts session[:user_id]
  	puts '**********************************'
  end
end