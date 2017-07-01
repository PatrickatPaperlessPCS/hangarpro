class Airport < ActiveRecord::Base

has_many :hangars


extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [
      :id_code,
      [:id_code, :name],
    ]
  end

def formatted_name
  "#{id_code} | #{name} | #{iata_code}"
end

def formatted_city_state
	"#{city}, #{state} #{country}"
end

end

