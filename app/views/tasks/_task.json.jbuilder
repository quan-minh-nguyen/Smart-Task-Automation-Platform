json.extract! task, :id, :title, :description, :start_time, :end_time, :created_at, :updated_at
json.url task_url(task, format: :json)
