json.extract! lecture, :id, :content, :attachment, :course, :created_at, :updated_at
json.url lecture_url(lecture, format: :json)
