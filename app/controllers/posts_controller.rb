class PostsController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿に成功しました"
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "編集に成功しました"
      redirect_to posts_path(@post.id)
    else
      flash.now[:alert] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(post.user.id)
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :body)
  end

  def is_matching_login_user
    unless Post.find(params[:id]).user.id == current_user.id
      redirect_to posts_path
    end
  end

end
