class Profile < ActiveRecord::Base
	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
	        	csv << column_names
        		all.each do |camper|
            			csv << camper.attributes.values_at(*column_names)
        		end
		end
      	end
end
