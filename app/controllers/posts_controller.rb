class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]


  def index
    # if params[:category].blank?
    # @post = Post.all.order("created_at DESC")

    # else
      # @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.all
    # end
  end
  def show
    #code
    @post=Post.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "The post was created sucessfully! <3"
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
    params.require(:post).permit [:title ,:content, :category_id]
  end
  def find_post
    @post=Post.find(params[:id])
  end
end
