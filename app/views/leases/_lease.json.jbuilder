json.extract! lease, :id, :lease_start, :lease_term, :lease_end, :lease_signed, :signature, :additional_file, :created_at, :updated_at
json.url lease_url(lease, format: :json)