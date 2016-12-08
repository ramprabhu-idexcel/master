class QuizSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer, :type, :question_name, :option
end
