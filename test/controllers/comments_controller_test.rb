# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
  end

  test 'should create a comment' do
    post post_comments_path(post_id: Post.last.id),
         params: { post_comment: { content: 'MyString' } }
    created_comment = PostComment.find_by(
      content: 'MyString',
      post_id: Post.last.id,
      user_id: users(:one).id
    )

    assert_redirected_to post_url(Post.last)
    assert(created_comment)
  end

  test 'should not create an empty comment' do
    post post_comments_path(post_id: Post.last.id),
         params: { post_comment: { content: '' } }

    not_created_comment = PostComment.find_by(
      content: ''
    )

    assert_redirected_to post_url(Post.last)
    assert_nil(not_created_comment)
  end

  test 'should destroy comment' do
    comment = PostComment.last

    delete comment_path(comment)

    deleted_comment = PostComment.find_by(
      content: comment.content,
      post_id: comment.post_id,
      user_id: comment.user_id
    )

    assert_redirected_to post_path(posts(:with_comments))
    assert_nil(deleted_comment)
  end
end
