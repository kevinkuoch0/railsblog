class PostsController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(params[:user])
    redirect_to @user
  end

  def update
    @post.update(params[:user])
    redirect_to @user
  end

  def post
    @post.post(params[:id])
  end

end