class SessionController < ApplicationController
	before_filter :restrict_access, :only => :logout

	def login
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
#			if !user.activate?(params[:token])
#				render :nothing => true, :status => :payment_required and return
#			end	

			Token.cleanup(user)
			auth = Token.new(user: user)
			if auth.save()
				render :json => auth, :only=> [:token, :expires]
				return
			end
			render :nothing => true, :status => :internal_server_error 
		else
			render :nothing => true, :status => :unauthorized
		end
	end

	def register
		user = User.new(email: params[:email], password: params[:password], 
			password_confirmation: params[:confirm])
		if user.save()
#			message = PrimaryMailer.registration(user.email, user.active)
#			message.deliver
			render :nothing => true and return
		end
		render :json => user.errors.messages, :status => :unauthorized
	end

	def logout 
		Token.cleanup(@current_user)
		render :nothing => true
	end

end
