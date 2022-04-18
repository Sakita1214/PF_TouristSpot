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

    if @post.save!
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      render :edit
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
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
    params.require(:post).permit(:user_id, :genre_id, :place, :description, :image)
  end

end
