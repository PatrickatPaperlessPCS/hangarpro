json.extract! hangar, :id, :type, :size, :last_payment, :first_payment, :leased, :created_at, :updated_at
json.url hangar_url(hangar, format: :json)