class Public::SightsController < ApplicationController

  def index
    @sights = Sight.all
    @post = Post.new
    @posts = Post.all
    @categories = Category.all

    if params[:categories].present?
      post_ids = []
      params[:categories].each_with_index do |category_id,i|
        if i == 0
          post_ids =  Post.joins(:post_categories).where(post_categories:{category_id: category_id}).pluck(:id)
          pp post_ids
        else
          post_ids =  Post.joins(:post_categories).where(post_categories:{category_id: category_id}).where(id: post_ids).pluck(:id)
          pp post_ids
        end
      end
      @posts = Post.find(post_ids)
    end
    #@post = Kaminari.paginate_array(items).page(params[:page]).per(10)

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
