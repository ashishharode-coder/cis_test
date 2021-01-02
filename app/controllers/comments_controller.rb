class CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(comment_params)
    add_guest(comment) unless user_signed_in?
    if comment.save
      flash[:notice] = "Comment Added."
    else
      flash[:notice] = comment.errors.full_messages[0]
    end
    redirect_to root_path
  end

  def create_reply
    comment = Comment.find(params[:id])
    reply = comment.replies.new(reply_params)
    reply.content = params[:comment][:content]
    if reply.save
      flash[:notice] = "reply Added."
    else
      flash[:notice] = reply.errors.full_messages[0]
    end
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :main_comment_id, :content)
  end

  def reply_params
    params.require(:comment).permit(:user_id, :content)
  end

  def add_guest(comment)
    comment.build_guest(name: params[:comment][:guest_name]).save
  end
end