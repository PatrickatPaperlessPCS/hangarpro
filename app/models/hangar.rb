class Hangar < ActiveRecord::Base

	belongs_to :airport
	belongs_to :user
	belongs_to :owner
	has_one :lease

	def available
	   return true unless self.lease.present?
	   end_date = self.lease.lease_start + self.lease.lease_term
	   Date.today < self.lease.lease_start || Date.today > end_date
	end

	  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_airport_id,
      :with_created_at_gte
    ]
  )
	   # Scope definitions. We implement all Filterrific filters through ActiveRecord
  # scopes. In this example we omit the implementation of the scopes for brevity.
  # Please see 'Scope patterns' for scope implementation details.
  scope :search_query, lambda { |query|
    # Filters students whose name or email matches the query
    
  }
  scope :sorted_by, lambda { |sort_key|
    # Sorts students by sort_key
    
  }
  scope :with_airport_id, lambda { |airport_id|
    # Filters students with any of the given country_ids
    
  }
  # This method provides select options for the `sorted_by` filter select input.
  # It is called in the controller as part of `initialize_filterrific`.
  def self.options_for_sorted_by
    [
      ['Name (a-z)', 'hangar.airport.formatted_name_asc'],
      ['Registration date (newest first)', 'created_at_desc'],
      ['Registration date (oldest first)', 'created_at_asc'],
      ['Aiport (a-z)', 'aiport_name_asc']
    ]
  end
end
