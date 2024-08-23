# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should create a like' do
    sign_in users(:two)

    post post_likes_path(post_id: Post.last.id)

    created_like = PostLike.find_by(
      post_id: Post.last.id,
      user_id: users(:two).id
    )

    assert_redirected_to post_url(Post.last)
    assert(created_like)
  end

  test 'should destroy a like' do
    sign_in users(:one)
    like = PostLike.last
    assert_equal(like.user, users(:one))

    delete post_like_path(like.post, like)

    deleted_like = PostLike.find_by(
      post_id: like.post_id,
      user_id: like.user_id
    )

    assert_redirected_to post_path(posts(:with_comments))
    assert_nil(deleted_like)
  end
end
