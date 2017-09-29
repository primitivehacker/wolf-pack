json.extract! user_study_session, :id, :study_session_id, :user_id, :created_at, :updated_at
json.url user_study_session_url(user_study_session, format: :json)
