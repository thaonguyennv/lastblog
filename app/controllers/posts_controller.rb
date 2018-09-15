class PostsController < ApplicationController

  before_action :find_post, only: (:show, :edit, :update, :destroy)


  def index
    @post = Post.all
  end
  def show
    #code
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to_@post, notice: "The post was created sucessfully! <3"
      # flash[:success] = "The post was created!"
      # redirect_to_@post
    else
      render 'new'
    end
  end
  def edit
    #code
  end
  def update
    if @post.update(post_params)
      redirect_to_@post, notice: "The post was updated!"
    else
      render 'edit'
    end
  end
  def destroy
    @post = Post.destroy
    redirect_to root_path, notice: "The post was destroyed"
  end

private

  def post_params
    params.require(:post).permit (:title ,:content, :category_id)
  end
  def find_post
    @post=Post.find(params[:id])
  end
end
