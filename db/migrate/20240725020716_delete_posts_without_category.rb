class DeletePostsWithoutCategory < ActiveRecord::Migration[7.1]
  def change
    Post.where(category: nil).destroy_all
  end
end
