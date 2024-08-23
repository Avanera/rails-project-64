# frozen_string_literal: true

module PostsHelper
  def render_post_likes_icon(post)
    if current_user
      icon_with_a_link(post)
    else
      content_tag(:i, '', class: 'i bi bi-hand-thumbs-up text-dark')
    end
  end

  private

  def icon_with_a_link(post)
    like = current_post_like(post)
    if like
      link_to post_like_path(post, like), data: { turbo_method: :delete }, class: 'text-dark' do
        content_tag(:i, '', class: 'i bi bi-hand-thumbs-up-fill')
      end
    else
      link_to post_likes_path(post), data: { turbo_method: :post }, class: 'text-dark' do
        content_tag(:i, '', class: 'i bi bi-hand-thumbs-up')
      end
    end
  end

  def current_post_like(post)
    return unless current_user

    post.likes.find { |like| like.user_id == current_user.id }
  end
end
