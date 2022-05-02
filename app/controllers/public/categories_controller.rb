class Public::CategoriesController < ApplicationController
  def create
    category = Category.find
    if category.save
      redirect_to post_path(post)
    else
      redirect_to post_path(post)
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end


end
