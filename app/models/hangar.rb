class Hangar < ActiveRecord::Base

	belongs_to :airport
	belongs_to :user
	has_one :lease

	def available
	   return true unless self.lease.present?
	   end_date = self.lease.lease_start + self.lease.lease_term
	   Date.today < self.lease.lease_start || Date.today > end_date
	end
end
