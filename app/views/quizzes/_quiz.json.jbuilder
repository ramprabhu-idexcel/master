json.extract! quiz, :id, :question, :answer, :type, :question_name, :option, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)