class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :destroy, :update]

  def create
    comment = @post.comments.create! comment_params
    CommentsMailer.submitted(comment).deliver_later if comment
    CommentBroadcastJob.perform_later(comment) if comment
    #CommentsChannel.broadcast(comment)

    redirect_to @post
  end

  def destroy
    @comment.destroy
    CommentsChannel.delete_to(@comment)
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    CommentsChannel.update_to(@comment)
    redirect_to @post
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
