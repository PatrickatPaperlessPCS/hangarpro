module AirportsHelper

	def to_decimal(coords)
	  coords.gsub(/(\d+)-(\d+)-(\d+.\d+)([NSWE])/) do
	    ($1.to_f + $2.to_f/60 + $3.to_f/3600) * (%w[N E].include?($4) ? 1 : -1)
	  end
	end

end
