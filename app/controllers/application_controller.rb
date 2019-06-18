class ApplicationController < ActionController::Base

	def current_admin
		if session[:admin_id]
			Admin.find_by(id: session[:admin_id])
		end
	end

	def authenticate
		unless current_admin != nil
			flash[:danger] = "You must be logged in to view this"
			redirect_to login_url
		end
	end

end
