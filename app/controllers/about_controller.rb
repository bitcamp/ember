class AboutController < ApplicationController
	include ActionController::MimeResponds
	def fine 
		array = ["this", "is", "a", "test"]
		@test = ["hello", array, "world"]
		respond_to do |format|
			format.json {render :json => @test}
		end

	end

end
