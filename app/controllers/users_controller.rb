class UsersController < ApplicationController
  def show
    
    # 各ユーザーのマイページ
    user = User.find(params[:id])
    @nickname = user.nickname
    @posts = user.posts.page(params[:page]).per(5).order("created_at DESC")

    # どのマイページ見ても自分のが打つ売る
    @nickname = current_user.nickname
    @posts = current_user.posts.page(params[:page]).per(5).order("created_at DESC")
    # @posts = Post.where(user_id: current_user.id)
    
  end
end
