json.extract! study_session, :id, :title, :room_number, :date, :time, :tenant_id, :created_at, :updated_at
json.url study_session_url(study_session, format: :json)
