class ApplicationController < ActionController::API
	include ActionController::HttpAuthentication::Token::ControllerMethods
	include ActionController::HttpAuthentication::Basic::ControllerMethods

	#force_ssl
	
	def restrict_access
		authenticate_or_request_with_http_token do |token, options|
    		@current_user = Token.extend_token(token)
  		end
	end

	def requireadmin
		authenticate_or_request_with_http_token do |token, options|
    		@current_user = Token.extend_token(token)
  		end
		unless @current_user != nil && @current_user.role > 0
			render :nothing => true, :status => :unauthorized
		end
	end

	def httpauth
  		authenticate_or_request_with_http_basic do |username, password|
		username == ENV['RAILS_CSV_USER'] && password == ENV['RAILS_CSV_PASS']
  		end
	end
end
