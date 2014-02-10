class Preregister < ActiveRecord::Base
	validates :email, :presence => true, :email => true
	validates :name, length: { maximum: 50 }
	validates :university, length: { maximum: 70 }
end
