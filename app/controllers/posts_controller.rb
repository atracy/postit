class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update]
  before_action :require_user, only: [:new, :create, :edit, :update]
  before_action :require_creator, only: [:edit, :update]
  def index
    @post = Post.all
    #view template is rendered
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user
    #memorize this pattern for creating an item
    if @post.save
      flash[:notice] = "You created a new post!"
      redirect_to posts_path
    else
      #handle validations
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def edit

  end

  def show

    @comment = Comment.new
  end

  def update


    if @post.update(post_params)
      flash[:notice] = "Post has been updated"
      redirect_to posts_path
    else
      #handle validations
      render :edit
    end
  end

  def destroy

  end

  private

  def post_params
    #if current_user.admin?
    #  params.require(:post).permit!
    #else
      params.require(:post).permit(:url, :title)
    #end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def require_creator
    if @post.creator != current_user
      access_denied  #if @post.creator != current_user
    end
  end
end
