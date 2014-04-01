class AboutController < ApplicationController
	include ActionController::MimeResponds
	before_filter :httpauth, :only => :bigdata
	
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

#	def data
#		@campers = Preregister.order(:name)
#		send_data @campers.to_csv
#	end

	def bigdata 
               @campers = User.all

		json = @campers.as_json(:include => :profile, :except => [:id, :password_digest, :active, :created_at])
	#	campers = User.order(:last)
		@csv_string = ""
		@csv_string += json.first.collect {|k,v| k}.join(',') + "\n"
		@csv_string += json.collect {|node| "#{node.collect{|k,v| v}.join(',')}\n"}.join

		send_data @csv_string
	end

	def form
		render :text => '<form method="post"><input type="text" name="email" /></form>'
	end

	def procd
		email = params[:email]
		u = User.find_by_email(email)
		w = u.waiver
		if w == nil
			u.waiver = Waiver.new
			u.waiver.emailk = SecureRandom.hex
			u.waiver.save()
		end
		w = u.waiver
		message = PrimaryMailer.registration(u.email, w.emailk	)
		message.deliver
		render :text => w.emailk
	end

	def waiver
		u = User.find_by_email(params[:email])
		if u == nil || u.waiver == nil
			render :text => "There has been an error."
		end
		if u.waiver.emailk == params[:token]
			render :text => "Form would be displayed here" and return
		else
			render :text => "There has been an error."
		end

	end


end
