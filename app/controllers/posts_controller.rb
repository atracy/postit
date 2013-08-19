class PostsController < ApplicationController
  def index
    @post = Post.all
    #view template is rendered
  end

  def create
    @post = Post.new(params.require(:post).permit!)
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
    @post = Post.find(params[:id])
  end

  def update

  end

  def destroy

  end

end
