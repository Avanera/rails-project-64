# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    post.post_likes.find_or_create_by(user: current_user)
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    post.post_likes.find_by(user: current_user)&.destroy

    redirect_to post_path(post)
  end
end
