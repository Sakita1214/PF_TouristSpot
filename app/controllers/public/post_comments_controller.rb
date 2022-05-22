class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

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

end
