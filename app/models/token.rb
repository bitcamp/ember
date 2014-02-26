class Token < ActiveRecord::Base
	before_create :generate_token
	belongs_to :user

	@@duration = 1.hours

	def generate_token
		begin
			self.token = SecureRandom.hex
			self.expires = Time.now + @@duration
		end while self.class.exists?(token: token)
	end

	def self.extend_token(tokenIn)
		token = find_by(token: tokenIn)
		if token != nil && token.expires > Time.now
			token.expires = Time.now + @@duration
			if token.save()
				return token.user
			end
		end
	end

	def self.cleanup(user)
		token = where(user: user)
		if token != nil
			token.each do |t|
				t.destroy
			end
		end
	end
end
  		