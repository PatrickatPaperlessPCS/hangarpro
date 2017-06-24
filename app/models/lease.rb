class Lease < ActiveRecord::Base

	belongs_to :user
	belongs_to :hangar
	belongs_to :airport
end
