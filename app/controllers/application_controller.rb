class ApplicationController < ActionController::API
	include ActionController::HttpAuthentication::Token::ControllerMethods
	#force_ssl
	
	def restrict_access
		authenticate_or_request_with_http_token do |token, options|
    		@current_user = Token.extend_token(token)
  		end
	end
end
