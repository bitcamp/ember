class WaiverController < ApplicationController
	before_filter :restrict_access	
	def status
		waiver = @current_user.waiver 
		if waiver != nil && waiver.agreed
			render :nothing => true
		else
			render :json => @current_user.profile, :only=> [:first, :last]
		end
	end

	def sign
		profile = @current_user.profile
		if profile != nil && profile.waiver == nil
			name = profile.first + " " + profile.last
			if name == params[:name]
				@current_user.waiver = Waiver.new
				@current_user.waiver.name = name
				@current_user.waiver.agreed = true
				if @current_user.waiver.save()
					message = PrimaryMailer.waiver(@current_user.email)
            		message.deliver
					render :nothing => true and return
				end
			end
		end
		render :nothing => true, :status => :bad_request


	end
end
