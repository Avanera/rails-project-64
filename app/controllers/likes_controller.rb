# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    post = Post.find(params[:post_id])
    post.post_likes.create(user: current_user)
    redirect_to post_path(post)
  end

  def destroy
    like = PostLike.find(params[:id])
    return if like.user != current_user

    post = like.post
    like.destroy

    redirect_to post_path(post)
  end
end
