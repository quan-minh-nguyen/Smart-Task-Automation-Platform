json.extract! ctask, :id, :title, :description, :created_at, :updated_at
json.url ctask_url(ctask, format: :json)
