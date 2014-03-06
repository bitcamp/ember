class ResetController < ApplicationController
	def token
		user = User.find_by_email(params[:email])
		if user
			reset = Reset.new(user: user)
			message = PrimaryMailer.reset(user.email, reset.token)
			message.deliver
		end
		render nothing: true
	end

	def reset
		reset = Reset.find_by_token(params[:token])
		if reset
			user = reset.user
			user.password = params[:password]
			user.password_confirmation = params[:confirm]
			if user.password == user.password_confirmation
				if user.save
					render nothing: true and return
				end
				render :nothing => true, :status => :internal_server_error
			else
				render :nothing => true, :status => :unauthorized
			end
		end
		render :nothing => true, :status => :unauthorized
end
