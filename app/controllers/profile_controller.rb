class ProfileController < ApplicationController
	before_filter :restrict_access	

	def read
		if @current_user.profile == nil
			@current_user.profile = Profile.new
		end
		render :json => @current_user.profile, :only=>[:first, :last, :school, :website, :github, :blurb, :complete, :tshirt, :dietary, :travel, :stipend, :resume, :notes]
	end

	def update
		profile = @current_user.profile
		if @current_user.profile == nil
			profile.new(profile_params)
		else 
			profile.update_attributes(profile_params)
		end
	end

	 private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def profile_params
      params.require(:profile).permit(:first, :last, :school, :blurb, :github, :website, :complete, :tshirt, :dietary, :travel, :stipend, :resume, :notes)
    end
end
