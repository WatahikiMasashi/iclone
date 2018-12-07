class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new,:edit,:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :other_person,only: [:edit, :update, :destroy]
  # GET /posts
  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      PostMailer.post_mail(@post).deliver
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"ブログを削除しました！"
  end

  private

  def post_params
    params.require(:post).permit(:content,:image ,:image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
