class SessionsController < ApplicationController
  def new
  end

  def log_in(admin)
  	session[:admin_id] = admin.id
  end

  def log_out
  	session.delete(:admin_id)
  	current_admin = nil
  end

  def create
  	# byebug
  	admin = Admin.find_by(email: params[:session][:email].downcase)
  	if admin && admin.authenticate(params[:session][:password])
  		#redirect to post control page 
  		log_in admin
  		redirect_to posts_url
  	else
  		#create error message and redirect to login page
	  	flash[:danger] = "Invalid password or email"
	  	render 'new'
	 end
  end

	def destroy
		log_out
		redirect_to root_url
  	end
end
