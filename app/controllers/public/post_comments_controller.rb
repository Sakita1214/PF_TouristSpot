class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_current_user, only: [:edit, :update]

  def index
    @post_comment = PostComment.new
    @post = Post.find(params[:post_id])

  end

  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    if comment.save
      redirect_to post_path(post)
    else
      redirect_to post_path(post)
    end

    #byebug
    if comment.image.attached?
      tags = Vision.get_image_data(comment.image)
      tags.each do |tag|
        comment.tags.create(name: tag)
      end
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find(params[:id])
  end


  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  def update
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find(params[:id])
      if @post_comment.update(post_comment_params)
        redirect_to edit_post_post_comment_path(@post.id, @post_comment.id), notice: "コメントを編集しました"
      else
        flash.now[:danger] = "編集に失敗しました"
        render 'edit'
      end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :image)
  end

  def require_current_user
    @post_comment = PostComment.find(params[:id])
    if @post_comment.user != current_user
      redirect_to root_path
    end
  end
end
