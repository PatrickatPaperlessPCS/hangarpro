class Hangar < ActiveRecord::Base

	belongs_to :airport
	belongs_to :user
	has_one :lease
end
