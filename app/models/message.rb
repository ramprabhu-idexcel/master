class Message < ApplicationRecord
  attribute :user_id, :integer
  after_create_commit { create_event }

  private

  def create_event
    Event.create!(message: self.comment, user_id: self.user_id)
  end
end
