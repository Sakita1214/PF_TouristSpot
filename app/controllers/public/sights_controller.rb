class Public::SightsController < ApplicationController

  def index
    @sights = Sight.all
    @post = Post.new
    @posts = Post.all
  end


  #地図機能

  #地図上登録機能

  #地図上詳細画面遷移

  #地図上検索機能

  #絞り込み検索機能

  private

  def post_params
      params.require(:post).permit(:body,:lat,:lng)
  end

end
