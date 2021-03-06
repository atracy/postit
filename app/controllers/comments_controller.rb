class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:body))
    #this assigns the comment to the post (line below)
    @comment.post = @post
    @comment.creator = current_user
    if @comment.save
      flash[:notice] = "your comment was created"
      redirect_to post_path(@post)

    else
      render 'posts/show'
    end

  end
end
