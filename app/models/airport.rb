class Airport < ActiveRecord::Base

	has_many :hangars

def formatted_name
  "#{id_code} | #{name} | #{iata_code}"
end

def formatted_city_state
	"#{city}, #{state} #{country}"
end

end