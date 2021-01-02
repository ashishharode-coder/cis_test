class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @posts = Post.includes(:comments).order(created_at: :desc)
      @post  = current_user.posts.new
    else
      @posts = Post.includes(:comments).pub.order(created_at: :desc)
    end
  end

  def create
    post  = current_user.posts.new(post_params)
    if post.save
      flash[:notice] = "Post created successfully."
    else
      flash[:notice] = post.errors.full_messages[0]
    end
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:text, :is_private)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end
end
