# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should create a like' do
    sign_in users(:two)

    assert_difference('PostLike.count') do
      post post_likes_path(post_id: Post.last.id)
    end

    assert_equal(PostLike.last.user, users(:two))
    assert_redirected_to post_url(Post.last)
  end

  test 'should destroy a like' do
    sign_in users(:one)
    like = PostLike.last

    assert_equal(like.user, users(:one))

    assert_difference('PostLike.count', -1) do
      delete post_like_path(like.post, like)
    end

    assert_redirected_to post_path(posts(:with_comments))
  end
end
