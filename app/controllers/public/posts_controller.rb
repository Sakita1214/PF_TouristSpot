class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.latitude = params[:post][:latitude].to_f
    @post.longitude = params[:post][:longitude].to_f
    @post.user_id = current_user.id


    # category_list = params[:post][:name].split(',')
    if @post.save
      # @post.save_category(category_list)
      redirect_to post_path(@post),notice:'投稿完了しました:)'
    else
      render:new
    end


    # if @post.save!
    #   redirect_to post_path(@post.id)
    # else
    #   render :new
    # end
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments= @post.post_comments
    @categories = Category.all

  end

  def update
    @post = Post.find(params[:id])

    # PostCategory.create!(post_id: @post.id, category_id: params[:post][:category_id])

    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :place, :description, :image, post_categories_attributes: [:id, :category_id, :_destroy])
  end

end
