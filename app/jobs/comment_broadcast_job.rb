class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)
    CommentsChannel.create_to(comment)
  end
end
