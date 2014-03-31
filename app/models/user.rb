class User < ActiveRecord::Base
	before_create :setup
	has_one :profile

	has_secure_password
	validates_presence_of :password, :email, :on => :create
	validates :email, :presence => true, :email => true, :uniqueness => true, :on => :create
	validates :password, length: { minimum: 5 }, :on => :create

	def activate?(token)
		id = self.id
		if token == self.active
			self.active = "ok"
			self.save()
		end
		self.active == "ok"
	end


	def setup
		self.active = SecureRandom.hex
		self.role = 0
	end

	def self.to_csv(options = {})
                CSV.generate(options) do |csv|
                        csv << column_names
                        all.each do |camper|
                                csv << camper.attributes.values_at(*column_names)
                        end
                end
        end


	
end
