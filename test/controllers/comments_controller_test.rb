# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test 'should create a comment' do
    assert_difference('PostComment.count') do
      post post_comments_path(post_id: Post.last.id),
           params: { post_comment: { content: 'MyString' } }
    end

    assert_equal(PostComment.last.user, users(:one))
    assert_redirected_to post_url(Post.last)
  end

  test 'should not create an empty comment' do
    assert_no_difference('PostComment.count') do
      post post_comments_path(post_id: Post.last.id),
           params: { post_comment: { content: '' } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test 'should destroy comment' do
    assert_difference('PostComment.count', -1) do
      delete comment_path(PostComment.last)
    end

    assert_redirected_to post_path(posts(:with_comments))
  end
end
