class Quiz < ApplicationRecord
  validates :question, :answer, :type, :question_name, :option, presence: true
end
