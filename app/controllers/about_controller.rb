class AboutController < ApplicationController
	include ActionController::MimeResponds
	before_filter :restrict_access
	
	def signup
		info = Preregister.new(name: params[:name], email: params[:email], 
			university: params[:university])
		if info.save()
			message = PrimaryMailer.preregister(info.email, info.name)
			message.deliver
			render nothing: true and return
		end
		render :nothing => true, :status => :unauthorized
	end

	def heartbeat
		render :nothing => true
	end
end