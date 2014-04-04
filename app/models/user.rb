class User < ActiveRecord::Base
	before_create :setup
	has_one :profile
	has_one :waiver
	has_one :checkin

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
                        csv << ["first", "last", "email", "waiver"]
                        all.each do |camper|
                        		waiver = false
                        		if camper.waiver != nil && camper.waiver.agreed
                        			waiver = true
                        		end
                        		if camper.profile != nil
                                	csv << [camper.profile.first, camper.profile.last, camper.email, waiver]
                                end
                        end
                end
        end


	
end
