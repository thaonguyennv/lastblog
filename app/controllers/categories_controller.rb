class CategoriesController < ApplicationController

    before_action :find_category, only: [:show, :edit, :update, :destroy]


    def index
      # if params[:category].blank?
      # @post = Post.all.order("created_at DESC")

      # else
        # @category_id = Category.find_by(name: params[:category]).id
        @categories = Category.all
      # end
    end
    def show
      #code
    end
    def new
      @categories = Category.new
    end
    def create
      @categories = Category.new(category_params)

      if @categories.save
        redirect_to @categories, notice: "The Category was created sucessfully! <3"
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
      if @categories.update(category_params)
        redirect_to_@categories, notice: "The category was updated!"
      else
        render 'edit'
      end
    end
    def destroy
      @categories = Category.destroy
      redirect_to root_path, notice: "The category was destroyed"
    end

  private

    def category_params
      params.require(:category).permit [:name ,:description, :category_id]
    end
    def find_category
      @category=Category.find(params[:id])
    end
end
