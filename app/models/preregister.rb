class Preregister < ActiveRecord::Base
	validates :email, :presence => true, :email => true
	validates :name, length: { maximum: 50 }
	validates :university, length: { maximum: 70 }

  def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |camper|
            csv << camper.attributes.values_at(*column_names)
        end
      end
  end
end
