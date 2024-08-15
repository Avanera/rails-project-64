# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @post = posts(:without_comments)
  end

  test 'should get index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url, params: { post: {
        body: @post.body,
        title: @post.title,
        category_id: categories(:one).id
      } }
    end

    assert_equal(Post.last.creator, users(:one))
    assert_redirected_to post_url(Post.last)
  end

  test 'should NOT create post when params not valid' do
    assert_no_difference('Post.count') do
      post posts_url, params: { post: {
        body: 'not enough chars',
        title: '',
        category_id: ''
      } }
    end

    assert_response :unprocessable_entity
    assert_select 'form'
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    assert_equal(@post.category, categories(:two))

    patch post_url(@post), params: { post: {
      body: @post.body,
      title: @post.title,
      category_id: categories(:one).id
    } }

    @post.reload
    assert_equal(@post.category, categories(:one))
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
