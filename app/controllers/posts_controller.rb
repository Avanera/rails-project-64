# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show; end

  def new
    @post = current_user.posts.build
  end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to post_url(@post), notice: t('posts.actions.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post), notice: t('posts.actions.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!

    redirect_to posts_url, notice: t('posts.actions.deleted')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
