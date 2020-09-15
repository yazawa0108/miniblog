class PostsController < ApplicationController
  before_action :move_to_index, except:  [:index, :show]
  
  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    
  end
  
  def new
  end
  
  def create
    Post.create(title: posts_params[:title], text: posts_params[:text], user_id: current_user.id)
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
    @like = Like.new()
  end
  
  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.update(posts_params)
    end
  end
  
  def search
    @posts = Post.where('text LIKE(?)', "%#{params[:keyword]}%").limit(20).order("created_at DESC").page(params[:page]).per(5)
    @keyword = params[:keyword]
  end
  
  private
  def posts_params
    params.permit(:title, :text)
  end
  
  def move_to_index
  redirect_to action: :index unless user_signed_in?
  end

end
