class Airport < ActiveRecord::Base

	has_many :hangars
	has_many :users
	has_many :leases
end
