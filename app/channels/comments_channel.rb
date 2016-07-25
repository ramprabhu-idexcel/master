# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class CommentsChannel < ApplicationCable::Channel
  def self.create_to(comment)
    broadcast_to comment.post, create_comment: CommentsController.render(partial: 'comments/comment', locals: { comment: comment })
  end

  def self.delete_to(comment)
    broadcast_to comment.post, delete_comment: comment.id
  end

  def self.update_to(comment)
    broadcast_to comment.post, { update_comment: CommentsController.render(partial: 'comments/content', locals: { comment: comment }), comment_id: comment.id }
  end

  def subscribed
    Post.all.each { |post| stream_for post }
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
