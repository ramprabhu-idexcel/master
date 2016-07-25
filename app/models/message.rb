class Message < ApplicationRecord
  after_create_commit { create_event }

  private

  def create_event
    Event.create message: self.comment
  end
end
