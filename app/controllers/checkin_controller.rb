class CheckinController < ApplicationController
	before_filter :requireadmin
	def view
		@campers = User.all
		json = @campers.as_json(:include => [:profile,:checkin], :except => [:password_digest, :active, :created_at])
		render :json => json
	end

	def update
		user = User.find(params[:id])
		if user.checkin == nil
			user.checkin = Checkin.new
		end
		user.checkin.checkedin = ActiveRecord::ConnectionAdapters::Column.value_to_boolean(params[:checkedin])
		user.checkin.save
		render :json => user.checkin
	end
end
