# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    post = Post.find(params[:post_id])

    @comment = post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save!
      redirect_to post_path(post), notice: t('comments.created')
    else
      render :new, status: :unprocessble_entity
    end
  end

  def destroy
    comment = PostComment.find(params[:id])
    return if comment.user != current_user

    post = comment.post
    comment.destroy

    redirect_to post_path(post), notice: t('comments.destroyed')
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
