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
    post posts_url, params: { post: {
      body: @post.body,
      title: @post.title,
      category_id: categories(:one).id
    } }

    created_post = Post.find_by(
      body: @post.body,
      title: @post.title,
      category_id: categories(:one).id,
      creator_id: users(:one).id
    )

    assert_response :redirect
    assert(created_post)
  end

  test 'should NOT create post when params not valid' do
    post posts_url, params: { post: {
      body: 'not enough chars',
      title: '',
      category_id: ''
    } }

    not_created_post = Post.find_by(
      body: 'not enough chars'
    )

    assert_response :unprocessable_entity
    assert_select 'form'
    assert_nil(not_created_post)
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
    delete post_url(@post)

    deleted_post = Post.find_by(
      body: @post.body,
      title: @post.title,
      category_id: @post.category_id,
      creator_id: @post.creator_id
    )

    assert_redirected_to posts_url
    assert_nil(deleted_post)
  end
end
