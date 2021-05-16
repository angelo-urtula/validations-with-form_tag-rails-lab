class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update, :new, :create]

  def show
    set_post!
  end

  def edit
    set_post!
  end

  def new
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    set_post!
    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end